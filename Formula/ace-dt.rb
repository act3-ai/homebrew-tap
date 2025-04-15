# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class AceDt < Formula
  desc "A CLI tool for packaging, uploading, and downloading data from OCI registries."
  homepage "https://github.com/act3-ai/data-tool"
  version "1.15.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.25/ace-dt-v1.15.25-linux-amd64"
      sha256 "10090577132a7f7c15b587c54ff7210374e66d3963c061c26e98b054be95b7b5"

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
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.25/ace-dt-v1.15.25-linux-amd64"
      sha256 "b47ab4a6bc957a63374f93561f3e6db9b475d15986adb00fe9fd4123540e6f52"

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
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.25/ace-dt-v1.15.25-linux-amd64"
        sha256 "e6dff11cbdc6c512760cb5574de3acc78eea7857025f62203f07e462b10a21a6"

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
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.25/ace-dt-v1.15.25-linux-amd64"
        sha256 "93c5858e457e64ee49fdd9adebf9070c6e8bdde30bb437e186b5f25cf02320da"

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
