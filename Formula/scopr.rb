class Scopr < Formula
  desc "Launch Claude Code scoped to chosen repositories"
  homepage "https://github.com/narayanananth26/scopr"
  url "https://github.com/narayanananth26/scopr/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dd7f6d105020fbb779fb704982d24fab448559f7f09b84201f1a3f6b0ba156ac"
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
