# Formula Author Guide

## Intended Audience

This guide is intended for ACT3 developers.

## Formulas

Each file in the [`Formula`](../Formula/) folder defines a formula that Homebrew can use to install an application.

### Formula Setup

Create a formula file following the existing formulas as an example.

Below is a simple example of what an ACT3 formula file will look like, utilizing our authenticated download strategy, checksum verification, and a post-install test command. Replace `ExampleTool`/`example-tool` with your application's name.

`Formula/example-tool.rb`:

```ruby
# frozen_string_literal: true

require_relative "../lib/registry_download"

class ExampleTool < Formula
  desc "Example Tool"
  homepage "https://example.com/tool"
  version "v1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "foo", using: BlobDownloadStrategy
      sha256 "bar"
    end
    if Hardware::CPU.arm?
      url "foo", using: BlobDownloadStrategy
      sha256 "bar"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "foo", using: BlobDownloadStrategy
      sha256 "bar"
    end
    if Hardware::CPU.intel?
      url "foo", using: BlobDownloadStrategy
      sha256 "bar"
    end
  end

  def install
    bin.install "example-tool"
  end

  test do
    system "example-tool", "version"
  end
end
```

### Add a Formula

The ACT3 Pipeline automates the updating of this formula file when you create a new release of your application. To use this automation, a few conventions must be followed:

1. Pipeline trigger in your application's `.gitlab-ci.yml` file

   ```yaml
   trigger tap:
      extends:
         - .trigger tap
      variables:
         EXECUTABLE: <your-executable-name>
   ```

   - `HOMEBREW_TRIGGER_TOKEN` will need to be set as a CI variable in your project. Please ask maintainers of Homebrew Ace Tools for access.
   - If your repository distributes multiple executables, the job declaration can be duplicated for each executable

2. Version in formula file
   - The version string must match the format `version "1.0.0"`
3. URL-setting block

   - The file must contain a block like the following:

      ```ruby
         on_macos do
            if Hardware::CPU.intel?
               url "foo", using: BlobDownloadStrategy
               sha256 "bar"
            end
            if Hardware::CPU.arm?
               url "foo", using: BlobDownloadStrategy
               sha256 "bar"
            end
         end

         on_linux do
            if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
               url "foo", using: BlobDownloadStrategy
               sha256 "bar"
            end
            if Hardware::CPU.intel?
               url "", using: BlobDownloadStrategy
               sha256 "bar"
            end
         end
      ```

   - The triggered pipeline will replace the section with correct values for `url` and `sha256` for each platform

### Testing your Formula

Using [task](https://taskfile.dev/):

```sh
task lint
```

> The lint task runs `brew style`
