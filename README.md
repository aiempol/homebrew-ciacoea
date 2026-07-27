# homebrew-ciacoea

Il tap Homebrew di **[ciàcoea](https://ciacoea.com)** — dettatura vocale offline per
chi programma parlando.

## Installazione

```bash
brew install --cask aiempol/ciacoea/ciacoea
```

## Il primo avvio

Al primo avvio macOS dirà che «Apple non ha potuto verificare che sia libero da
malware». Non riguarda ciàcoea in particolare: lo dice di qualsiasi app non
notarizzata da Apple. ciàcoea **è firmata**, ma con un certificato nostro, non con un
Developer ID.

Per sbloccarla: *Impostazioni di Sistema → Privacy e sicurezza*, in fondo alla
sezione **Sicurezza**, premi **Apri comunque**.

Installare con `brew` **non evita** questo passaggio. Fino a Homebrew 5 c'era
`--no-quarantine`; Homebrew 6 l'ha rimosso di proposito, e la variabile
`HOMEBREW_CASK_OPTS` non lo sostituisce.

## Aggiornamenti

Non serve `brew upgrade`: **ciàcoea si aggiorna da sola**. Controlla
`ciacoea.com/scarica/latest.json`, verifica la firma del pacchetto e si sostituisce.
Il cask è marcato `auto_updates true` proprio per questo — due meccanismi che si
contendono la stessa applicazione fanno solo danni.

## Disinstallazione

```bash
brew uninstall --cask ciacoea
```

Restano i modelli vocali, che sono il grosso dello spazio (qualche centinaio di MB
l'uno). Per portare via anche quelli:

```bash
brew uninstall --zap --cask ciacoea
```

---

## Per chi mantiene questo tap

Questo repository contiene solo il cask. Il codice di ciàcoea sta altrove ed è privato.

A ogni rilascio vanno aggiornati **versione e sha256** in `Casks/ciacoea.rb`. Lo fa da
sé lo script `brand/aggiorna-cask.sh` del progetto principale, che legge il `.dmg`
appena compilato e riscrive il file: meglio che copiare un hash a mano, perché un
hash sbagliato non dà un errore comprensibile — dà un fallimento di verifica che
sembra un file corrotto.
