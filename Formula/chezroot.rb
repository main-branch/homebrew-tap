class Chezroot < Formula
  desc "A sudo wrapper for chezmoi to manage root-owned files"
  homepage "https://github.com/main-branch/chezroot"
  license "MIT"

  # These values are placeholders. The release.yml workflow will update them automatically.
  version "0.1.4"
  url "https://github.com/main-branch/chezroot/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "d89613387abac6ec23b823c1628f1b1268aa2bbcb2d7e792f1a258bba336d2f1"

  head "https://github.com/main-branch/chezroot.git", branch: "main"

  # This tells Homebrew that it needs Go to build the binary
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