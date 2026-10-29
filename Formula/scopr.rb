class Scopr < Formula
  desc "Launch Claude Code scoped to chosen repositories"
  homepage "https://github.com/narayanananth26/scopr"
  url "https://github.com/narayanananth26/scopr/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "fae6384d4d3f370c8b5806cd9f5445d3c71c064965784038a2a3ebde3383a74a"
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
