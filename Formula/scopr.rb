class Scopr < Formula
  desc "Launch Claude Code scoped to chosen repositories"
  homepage "https://github.com/narayanananth26/scopr"
  url "https://github.com/narayanananth26/scopr/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "55eace6f92e7037911901810e6e0b213e2abc5071361f9bd37c85fe515cfc622"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/scopr"
    zsh_completion.install "completions/_scopr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopr version")
    assert_match "#compdef scopr", shell_output("#{bin}/scopr completion zsh")
  end
end
