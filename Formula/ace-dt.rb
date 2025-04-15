# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class AceDt < Formula
  desc "A CLI tool for packaging, uploading, and downloading data from OCI registries."
  homepage "https://github.com/act3-ai/data-tool"
  version "1.15.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.29/ace-dt-v1.15.29-darwin-amd64.tar.gz"
      sha256 "d487bc00eaddff615e72adec558942ccc67d8de83480bd8130c58f9e533c09eb"

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
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.29/ace-dt-v1.15.29-darwin-arm64.tar.gz"
      sha256 "f7a68f415366cf4b6467989a669c132c5cc44bbde12ffabaf75f158c457e9495"

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
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.29/ace-dt-v1.15.29-linux-amd64.tar.gz"
        sha256 "301d02bac49a0f596950a9eda7b2d57fd88a1d48df5335297f840d6d0612363a"

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
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.29/ace-dt-v1.15.29-linux-arm64.tar.gz"
        sha256 "439b4ff39073877c9ba6788cdb8936cf81b92eef9d9365b19e151da0f1d742cc"

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
