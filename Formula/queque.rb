class Queque < Formula
  desc "ZSH assistant triggered by ?? -- turns natural language into shell commands"
  homepage "https://github.com/k-leumas/queque"
  url "https://registry.npmjs.org/@k-leumas/queque-cli/-/queque-cli-0.1.0.tgz"
  sha256 "fc3f77911aa84114917a28e65c1fdfca44ce9e80545208980431409069d95870"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"qq").write_env_script "#{libexec}/dist/cli/main.js", {}
  end

  def caveats
    <<~EOS
      Add the following to your ~/.zshrc:

        source #{opt_libexec}/shell/zsh/qq.zsh
        export ANTHROPIC_API_KEY="sk-ant-..."

      Then reload: source ~/.zshrc

      QueQue uses Zellij for its floating pane UI (install: brew install zellij).
    EOS
  end

  test do
    assert_match "queque", shell_output("#{bin}/qq --version 2>&1")
  end
end
