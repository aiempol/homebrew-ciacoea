cask "ciacoea" do
  version "0.3.3"
  sha256 "b33ee96b279dce3d52352cffe8b357520e7de967f080375e089ef5cb4e2aff79"

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
