# frozen_string_literal: true

require_relative "../lib/registry_download"

class AsceHubCli < Formula
  desc "CLI for interacting with ACE Hub"
  homepage "https://git.act3-ace.com/ace/hub/cli"
  version "0.3.0"

  # Generated by https://git.act3-ace.com/ace/homebrew-ace-tools/-/blob/master/bin/formulize.sh
  on_macos do
    if Hardware::CPU.intel?
      url "reg.git.act3-ace.com/ace/hub/cli/releases/hub@sha256:88f8746dadaad580384e189a33a4e339e6ed7fa43d2bcfd81279fdc78bc63dbe",
          using: BlobDownloadStrategy
      sha256 "88f8746dadaad580384e189a33a4e339e6ed7fa43d2bcfd81279fdc78bc63dbe"
    end
    if Hardware::CPU.arm?
      url "reg.git.act3-ace.com/ace/hub/cli/releases/hub@sha256:fd2c33a2739988442843cc91feceb4be6b2b2c71aa2364791104b690fc1a24e4",
          using: BlobDownloadStrategy
      sha256 "fd2c33a2739988442843cc91feceb4be6b2b2c71aa2364791104b690fc1a24e4"
    end
  end

  # Generated by https://git.act3-ace.com/ace/homebrew-ace-tools/-/blob/master/bin/formulize.sh
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "reg.git.act3-ace.com/ace/hub/cli/releases/hub@sha256:aa7c885d2948a35cfa011ec66e7d3bd05586ba02e6c87849713d2227e87fc074",
          using: BlobDownloadStrategy
      sha256 "aa7c885d2948a35cfa011ec66e7d3bd05586ba02e6c87849713d2227e87fc074"
    end
    if Hardware::CPU.intel?
      url "reg.git.act3-ace.com/ace/hub/cli/releases/hub@sha256:e7872ce8615e7737ff0c5dc43fc3e6abd589352b8ad206c055cdfb7ce9d9f254",
          using: BlobDownloadStrategy
      sha256 "e7872ce8615e7737ff0c5dc43fc3e6abd589352b8ad206c055cdfb7ce9d9f254"
    end
  end

  def install
    bin.install "hub"

    with_homebrew_path do
      # Completions from downstream tools are sourced by asce,
      # so they must be discoverable on the PATH
      generate_completions_from_executable(bin/"hub", "completion")
    end

    # Generate manpages
    mkdir "man" do
      system bin/"hub", "gendocs", "man", "."
      man1.install Dir["*.1"]
      # man5.install Dir["*.5"]
    end
  end

  # test do
  #   system "#{bin}/hub", "version"
  # end
end
