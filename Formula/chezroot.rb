class Chezroot < Formula
  desc "A sudo wrapper for chezmoi to manage root-owned files"
  homepage "https://github.com/main-branch/chezroot"
  license "MIT"

  # These values are placeholders. The release.yml workflow will update them automatically.
  version "0.1.3"
  url "https://github.com/main-branch/chezroot/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "950a2c67acacaad9df347e1a1f918259791d82b1b6c7ecd14be84938d78132b8"

  head "https://github.com/main-branch/chezroot.git", branch: "main"

  # This tells Homebrew that it needs Go to build the binary
  depends_on "go" => :build
  # This tells Homebrew that chezroot requires chezmoi to run
  depends_on "chezmoi"

  def install
    # This command builds the binary from ./cmd/chezroot
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/chezroot"
    # This installs the built binary into the Homebrew bin directory
    bin.install "chezroot"
  end

  test do
    system bin/"chezroot", "--version"
  end
end