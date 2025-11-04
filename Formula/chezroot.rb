class Chezroot < Formula
  desc "A sudo wrapper for chezmoi to manage root-owned files"
  homepage "https://github.com/main-branch/chezroot"
  # This section will be for the Intel (amd64) binary
  url "https://github.com/main-branch/chezroot/releases/download/v0.1.12/chezroot_0.1.12_darwin_amd64.tar.gz"
  sha256 "be8a7eb09048fa722a49807460dfdab8e58a01fe2280f5c96adc780929ca0e4e"
  license "MIT"
  version "v0.1.12" # Homebrew uses the tag for the version

  # This block handles the Apple Silicon (arm64) binary
  on_arm do
    url "https://github.com/main-branch/chezroot/releases/download/v0.1.12/chezroot_0.1.12_darwin_arm64.tar.gz"
    sha256 "66d5247138fb72dfffccf7feb860fed94fd57c87c5bfb47b340527cc1c758997"
  end

  # We no longer need "go" to build, only "chezmoi" to run
  depends_on "chezmoi"

  def install
    # This just installs the binary from the downloaded tar.gz
    bin.install "chezroot"
  end

  test do
    system bin/"chezroot", "--version"
  end
end
