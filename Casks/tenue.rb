cask "tenue" do
  version "0.2.1"
  sha256 "5ed1389d0db0285914b2dddc2a14d1ed48948d5b01a2d1d116bf112f1ef74778"

  url "https://tenue.moverq.dev/dl/Tenue.dmg"
  name "tenué"
  desc "Личный менеджер секретов"
  homepage "https://tenue.moverq.dev/"

  # Только arm64 по той же причине, что и у formula: универсальный бинарь
  # требует полного Xcode.
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tenue.app"

  # Приложение подписано ad-hoc: Apple Developer Program проект сознательно
  # не покупает. Без снятия карантина Gatekeeper показал бы «не удалось
  # проверить разработчика» и не дал запустить.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "/Applications/Tenue.app"]
  end

  caveats <<~CAVEATS
    Откройте tenué из Launchpad и введите лицензионный ключ — его
    выдаёт владелец после оплаты ($5, разово).

    CLI ставится отдельно:
      brew install moverq1337/tenue/tenue-cli
  CAVEATS
end
