class Queque < Formula
  desc "ZSH assistant triggered by ?? -- turns natural language into shell commands"
  homepage "https://github.com/k-leumas/queque"
  url "https://github.com/k-leumas/queque/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      QueQue requires shell integration to activate the ?? trigger.
      Add the following to your ~/.zshrc:

        source $(brew --prefix)/lib/node_modules/queque/shell/zsh/qq.zsh

      You also need ANTHROPIC_API_KEY set in your environment:

        export ANTHROPIC_API_KEY="sk-ant-..."

      QueQue uses Zellij for its floating pane UI (install: brew install zellij).
      Minimum supported version: zellij >= 0.38
    EOS
  end

  test do
    assert_match "queque", shell_output("#{bin}/qq --version 2>&1")
  end
end
