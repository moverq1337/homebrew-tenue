class TenueCli < Formula
  desc "CLI личного менеджера секретов tenué"
  homepage "https://tenue.moverq.dev/"
  # Только arm64: универсальный бинарь требует полного Xcode, а проект
  # сознательно обходится Command Line Tools. Обещать сборку под Intel,
  # которой нет на сервере, значило бы отдавать 404.
  url "https://tenue.moverq.dev/dl/tenue-darwin-arm64"
  version "0.2.1"
  sha256 "f5bc32c6ace66d92b2b619f45c70758833c751026c7ec5ddb9bee7bf4ad962be"

  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "tenue-darwin-arm64" => "tenue"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tenue --version")
  end
end
