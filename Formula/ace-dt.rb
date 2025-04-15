# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class AceDt < Formula
  desc "A CLI tool for packaging, uploading, and downloading data from OCI registries."
  homepage "https://github.com/act3-ai/data-tool"
  version "1.15.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.26/ace-dt-v1.15.26-linux-amd64"
      sha256 "cbb11c0ec36bc9b076077d0397401a0be4369f1bd671b05239b1d35cd8119680"

      def install
        bin.install ace-dt
        generate_completions_from_executable(bin/"ace-dt", "completion")

        # Generate manpages
        mkdir "man" do
          system bin/"ace-dt", "gendocs", "man", "."
          man1.install Dir["*.1"]
        end
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.26/ace-dt-v1.15.26-linux-amd64"
      sha256 "394ee1cb88eeb10cc1d1ef86ef2d940172204b559767052c3a11610f078ca22a"

      def install
        bin.install ace-dt
        generate_completions_from_executable(bin/"ace-dt", "completion")

        # Generate manpages
        mkdir "man" do
          system bin/"ace-dt", "gendocs", "man", "."
          man1.install Dir["*.1"]
        end
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.26/ace-dt-v1.15.26-linux-amd64"
        sha256 "60a6744bf6c3c49d3c4ef99b5b7e25d596bcd09521ec37244bca08af3d9b5d2a"

        def install
          bin.install ace-dt
          generate_completions_from_executable(bin/"ace-dt", "completion")

          # Generate manpages
          mkdir "man" do
            system bin/"ace-dt", "gendocs", "man", "."
            man1.install Dir["*.1"]
          end
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.26/ace-dt-v1.15.26-linux-amd64"
        sha256 "061ee2442bc6241eb147a7ac8b774cbbd20fa2d440723a44455b9fee550ae1cf"

        def install
          bin.install ace-dt
          generate_completions_from_executable(bin/"ace-dt", "completion")

          # Generate manpages
          mkdir "man" do
            system bin/"ace-dt", "gendocs", "man", "."
            man1.install Dir["*.1"]
          end
        end
      end
    end
  end

  test do
    system "#{bin}/ace-dt version"
  end
end
