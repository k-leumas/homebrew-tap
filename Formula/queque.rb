class Queque < Formula
  desc "ZSH assistant triggered by ?? -- turns natural language into shell commands"
  homepage "https://github.com/k-leumas/queque"
  url "https://registry.npmjs.org/@k-leumas/queque-cli/-/queque-cli-0.1.0.tgz"
  sha256 "fc3f77911aa84114917a28e65c1fdfca44ce9e80545208980431409069d95870"
  license "MIT"
  version "0.1.0"

  depends_on "node"
  depends_on "jq"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      Add the shell integration to your ~/.zshrc:

        qq init zsh >> ~/.zshrc
        source ~/.zshrc

      Set your API key:

        export ANTHROPIC_API_KEY="sk-ant-..."
    EOS
  end

  test do
    assert_match "queque", shell_output("#{bin}/qq --version 2>&1")
  end
end
