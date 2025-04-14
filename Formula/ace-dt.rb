class Hops < Formula
  desc "A CLI tool for packaging, uploading, and downloading data from OCI registries."
  homepage "https://github.com/act3-ai/data-tool"
  version "v1.15.16"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.16/ace-dt-v1.15.16-darwin-amd64"
      sha256 "6b2e6fcb80f00b66f449066384ba6185bf1927bea3f7e747d746d3784cd3f216"

      def install
        bin.install "bin/ace-dt"
        generate_completions_from_executable(bin/ace-dt, "completion")

        # Generate manpages
        mkdir "man" do
          system bin/ace-dt, "gendocs", "man", "."
          man1.install Dir["*.1"]
        end
      end
    end
    on_arm do
      url "https://github.com/act3-ai/data-tool/releases/download/v1.15.16/ace-dt-v1.15.16-darwin-arm64"
      sha256 "4f5b1876935445c6ad2b7484a1bacfb6ded0336aa9c10376b3a8bf35c470ca20"

      def install
        bin.install "bin/ace-dt"
        generate_completions_from_executable(bin/ace-dt, "completion")

        # Generate manpages
        mkdir "man" do
          system bin/ace-dt, "gendocs", "man", "."
          man1.install Dir["*.1"]
        end
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.16/ace-dt-v1.15.16-linux-amd64"
        sha256 "b34cc817929e5a1bdb1aafe81702d407259ac33f708c4c7ce465fb9692ea2c17"

        def install
          bin.install "bin/ace-dt"
          generate_completions_from_executable(bin/ace-dt, "completion")

          # Generate manpages
          mkdir "man" do
          system bin/ace-dt, "gendocs", "man", "."
          man1.install Dir["*.1"]
          end
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/act3-ai/data-tool/releases/download/v1.15.16/ace-dt-v1.15.16-linux-arm64"
      sha256 "6292ac483485fb5deb19e3b06256f9b14afbc7293608248e146c9957bcd1bda6"

        def install
          bin.install "bin/ace-dt"
          generate_completions_from_executable(bin/ace-dt, "completion")

          # Generate manpages
          mkdir "man" do
          system bin/ace-dt, "gendocs", "man", "."
          man1.install Dir["*.1"]
          end
        end
      end
    end
  end

  test do
    system "#{bin}/ace-dt", "version"
  end
end
