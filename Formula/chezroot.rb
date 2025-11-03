class Chezroot < Formula
  desc "A sudo wrapper for chezmoi to manage root-owned files"
  homepage "https.github.com/main-branch/chezroot"
  # This section will be for the Intel (amd64) binary
  url "https://github.com/main-branch/chezroot/releases/download/v0.1.10/chezroot_0.1.10_darwin_amd64.tar.gz"
  sha256 "63a9b7ddc62db42b861903f6699193ed4fd10594520743e4c0a8da2c1a82369f"
  license "MIT"
  version "v0.1.10" # Homebrew uses the tag for the version

  # This block handles the Apple Silicon (arm64) binary
  on_arm do
    url "https://github.com/main-branch/chezroot/releases/download/v0.1.10/chezroot_0.1.10_darwin_arm64.tar.gz"
    sha256 "1652e06455ba17af2624b2da250bbf7e05233952d1079b987208ccefae8ca233"
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
