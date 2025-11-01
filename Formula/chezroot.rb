class Chezroot < Formula
  desc "A sudo wrapper for chezmoi to manage root-owned files"
  homepage "https://github.com/main-branch/chezroot"
  license "MIT"

  # These values are placeholders. GoReleaser will update them.
  version "0.1.0"
  url "https://github.com/main-branch/chezroot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  head "https://github.com/main-branch/chezroot.git", branch: "main"

  # This tells Homebrew that it needs Go to build the binary
  # This is still needed for users who build from source
  depends_on "go" => :build
  # This tells Homebrew that chezroot requires chezmoi to run
  depends_on "chezmoi"

  def install
    # This command builds the binary from ./cmd/chezroot
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/chezroot"
  end

  test do
    system bin/"chezroot", "--version"
  end
end
