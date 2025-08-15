# frozen_string_literal: true

# BlobDownloadStrategy downloads a .tar.gz blob from a registry
# This is preferable to Homebrew's built-in download strategies
#  because it piggybacks a user's registry authentication (~/.docker/config.json)
#  and even supports keychain credential storage
# The built-in download strategies of Homebrew only support authentication to one
#  registry at a time, and if that registry isn't GitHub's registry, the
#  homebrew/core tap will not work until the user removes the authentication.
class BlobDownloadStrategy < AbstractFileDownloadStrategy
  def initialize(url, name, version, **meta)
    super

    # Install dependencies
    # https://github.com/Homebrew/brew/blob/master/Library/Homebrew/extend/kernel.rb#L402C14-L402C14
    with_homebrew_path do
      # blobs are downloaded with oras because it uses registry authentication
      # enables downloads from private registry with credentials from ~/.docker/config.json
      Formula["oras"].ensure_installed!(reason: "fetching from an authenticated OCI registry")
    end
  end

  def fetch(timeout: nil)
    cached_location_exists = cached_location.exist?

    fresh = if version.respond_to?(:latest?)
      !version.latest?
    else
      true
    end

    # Handling of previous downloads, copied from:
    # https://github.com/Homebrew/brew/blob/c7bd51b9957e83393aedeca3f1afecc33a5be19c/Library/Homebrew/download_strategy.rb#L403
    if cached_location_exists && fresh
      odebug "Using cached blob", cached_location
    else
      download_blob(url)

      ignore_interrupts do
        cached_location.dirname.mkpath
        temporary_path.rename(cached_location)
        symlink_location.dirname.mkpath
      end
    end

    FileUtils.ln_s cached_location.relative_path_from(symlink_location.dirname), symlink_location, force: true
  end

  def download_blob(blob_url)
    ohai "Downloading #{url}"
    odie "Couldn't download blob" unless oras "blob", "fetch", "--output=#{temporary_path}", blob_url.to_s
  end

  def parse_basename(url, search_query: true)
    "#{name}--#{version}.tar.gz"
  end

  def oras(*args)
    # Command with PATH cooked up to contain the docker credential helper
    # PATH is set to allow credentials helpers to be found by oras
    # DBUS_SESSION_BUS_ADDRESS is set to preserve the dbus session for use by secret service password managers
    #   this was needed for linux users using the secretservice credStore in docker config
    # https://github.com/Homebrew/brew/blob/master/Library/Homebrew/extend/kernel.rb#L402C14-L402C14
    with_homebrew_path do
      with_env(
        "DBUS_SESSION_BUS_ADDRESS" => ENV.fetch("HOMEBREW_DBUS_SESSION_BUS_ADDRESS", nil),
      ) do
        system "#{HOMEBREW_PREFIX}/bin/oras", *args
      end
    end
  end
end
