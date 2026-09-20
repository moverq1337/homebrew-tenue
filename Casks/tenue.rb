cask "tenue" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://tenue.moverq.dev/dl/Tenue.dmg"
  name "tenué"
  desc "Личный менеджер секретов"
  homepage "https://tenue.moverq.dev/"

  # Только arm64 по той же причине, что и у formula: универсальный бинарь
  # требует полного Xcode.
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tenue.app"

  # Homebrew снимает карантин, поэтому ad-hoc подписанное приложение
  # запускается без Apple Developer Program.
  caveats <<~CAVEATS
    Откройте tenué из Launchpad и введите лицензионный ключ — его
    выдаёт владелец после оплаты ($5, разово).

    CLI ставится отдельно:
      brew install moverq1337/tenue/tenue-cli
  CAVEATS
end
