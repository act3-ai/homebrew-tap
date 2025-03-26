# frozen_string_literal: true

require_relative "../lib/registry_download"

class AceDt < Formula
  desc "ACE Data Tool"
  homepage "https://git.act3-ace.com/ace/data/tool"
  version "1.15.7"

  # Generated by https://git.act3-ace.com/ace/homebrew-ace-tools/-/blob/master/bin/formulize.sh
  on_macos do
    if Hardware::CPU.intel?
      url "reg.git.act3-ace.com/ace/data/tool/releases/ace-dt@sha256:2cca64d1d3deb550f4fb5355b7ba19d7749681d1208d964987f28a6b6c383537",
          using: BlobDownloadStrategy
      sha256 "2cca64d1d3deb550f4fb5355b7ba19d7749681d1208d964987f28a6b6c383537"
    end
    if Hardware::CPU.arm?
      url "reg.git.act3-ace.com/ace/data/tool/releases/ace-dt@sha256:52714487860b6cea24c50501e38ea8d611fbcbf9cb195aa76ea422cc9572739d",
          using: BlobDownloadStrategy
      sha256 "52714487860b6cea24c50501e38ea8d611fbcbf9cb195aa76ea422cc9572739d"
    end
  end

  # Generated by https://git.act3-ace.com/ace/homebrew-ace-tools/-/blob/master/bin/formulize.sh
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "reg.git.act3-ace.com/ace/data/tool/releases/ace-dt@sha256:c9654ea177b34fcfa91a221ae5a2f5a9f2c9434ba5e715d55aedc38be71706a6",
          using: BlobDownloadStrategy
      sha256 "c9654ea177b34fcfa91a221ae5a2f5a9f2c9434ba5e715d55aedc38be71706a6"
    end
    if Hardware::CPU.intel?
      url "reg.git.act3-ace.com/ace/data/tool/releases/ace-dt@sha256:53926cc80ed72a749fbc9fc9c1fbdd24b5992af03594d8fcb89712b2fd388708",
          using: BlobDownloadStrategy
      sha256 "53926cc80ed72a749fbc9fc9c1fbdd24b5992af03594d8fcb89712b2fd388708"
    end
  end

  def install
    bin.install "ace-dt"
    generate_completions_from_executable(bin/"ace-dt", "completion")

    # Generate manpages
    mkdir "man" do
      system bin/"ace-dt", "gendocs", "man", "."
      man1.install Dir["*.1"]
      man5.install Dir["*.5"]
    end

    # Generate JSON Schema definitions
    # Use pkgetc here so path doesn't change over version numbers
    # Cannot use symlink for this because VS Code cannot follow symlinks for schema files
    mkdir pkgetc do
      system bin/"ace-dt", "genschema", "."
    end
  end

  def caveats
    <<~EOS
      Add the following to VS Code's settings.json file to enable YAML file validation:
        "yaml.schemas": {
          "file://#{pkgetc}/config.dt.act3-ace.io.schema.json": [
            "ace-dt-config.yaml",
            "ace/dt/config.yaml"
          ],
          "file://#{pkgetc}/data.act3-ace.io.schema.json": "entry.yaml"
        }

      Add the following to VS Code's settings.json file to enable JSON file validation:
        "json.schemas": [
          {
            "fileMatch": [
              "entry.json"
            ],
            "url": "file://#{pkgetc}/data.act3-ace.io.schema.json"
          }
        ]

      Check out the quick start guide to get started with ace-dt:
        ace-dt info quick-start-guide
    EOS
  end

  test do
    system "#{bin}/ace-dt", "version"
  end
end
