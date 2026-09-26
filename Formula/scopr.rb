class Scopr < Formula
  desc "Launch Claude Code scoped to chosen repositories"
  homepage "https://github.com/narayanananth26/scopr"
  url "https://github.com/narayanananth26/scopr/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e6809a3e32d10eff20ba9d59edeeaef2739da79340e4ad807fb9d66902676201"
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
