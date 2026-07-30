cask "ciacoea" do
  version "0.3.2"
  sha256 "d1922debbfcdf34bc9c544628400abbb2a391d4ea14b898f4ca5b57d72215d47"

  url "https://ciacoea.com/scarica/Ciacoea_#{version}_aarch64.dmg"
  name "ciàcoea"
  desc "Dettatura vocale offline per chi programma parlando"
  homepage "https://ciacoea.com/"

  # Solo Apple Silicon per ora: il build Intel non c'è ancora.
  depends_on arch: :arm64
  depends_on macos: :catalina

  # ciàcoea si aggiorna da sé leggendo ciacoea.com/scarica/latest.json,
  # quindi Homebrew non deve metterci le mani: farebbe due meccanismi che
  # si contendono la stessa applicazione.
  auto_updates true

  app "Ciacoea.app"

  # Quando si disinstalla, si porta via tutto: modelli scaricati compresi,
  # che sono il grosso dello spazio occupato.
  zap trash: [
    "~/Library/Application Support/com.ciacoea.desktop",
    "~/Library/Caches/com.ciacoea.desktop",
    "~/Library/HTTPStorages/com.ciacoea.desktop",
    "~/Library/Logs/com.ciacoea.desktop",
    "~/Library/Preferences/com.ciacoea.desktop.plist",
    "~/Library/Saved Application State/com.ciacoea.desktop.savedState",
  ]

  caveats <<~EOS
    ciàcoea ha bisogno di due permessi per lavorare: microfono, per
    sentirti, e accessibilità, per scrivere il testo dentro l'app che
    stai usando. Te li chiede al primo avvio.

    Se l'hai installata senza --no-quarantine, macOS mostrerà un avviso
    perché l'app non è certificata da Apple. In quel caso:
      Impostazioni di Sistema → Privacy e sicurezza → Apri comunque
  EOS
end
