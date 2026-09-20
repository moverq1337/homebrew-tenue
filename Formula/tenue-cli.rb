class TenueCli < Formula
  desc "CLI личного менеджера секретов tenué"
  homepage "https://tenue.moverq.dev/"
  # Только arm64: универсальный бинарь требует полного Xcode, а проект
  # сознательно обходится Command Line Tools. Обещать сборку под Intel,
  # которой нет на сервере, значило бы отдавать 404.
  url "https://tenue.moverq.dev/dl/tenue-darwin-arm64"
  version "0.1.0"
  sha256 "a1ba024c5129c8c996699059d6e5dcca290daa3eebb0deace588ff96f6e145c9"

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
