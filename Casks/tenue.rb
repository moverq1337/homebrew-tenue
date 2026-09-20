cask "tenue" do
  version "0.1.2"
  sha256 "47ef6ab2cad8c3da032254d18a0d022a7df5c9f77f15604aacc697ce5e451ff3"

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
