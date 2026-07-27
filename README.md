# homebrew-ciacoea

Il tap Homebrew di **[ciàcoea](https://ciacoea.com)** — dettatura vocale offline per
chi programma parlando.

## Installazione

```bash
brew install --cask --no-quarantine aiempol/ciacoea/ciacoea
```

`--no-quarantine` non è un dettaglio: senza, macOS marca l'app come scaricata da
internet e al primo avvio mostra l'avviso «Apple non ha potuto verificare che sia
libero da malware», che poi si sblocca solo passando dalle Impostazioni di Sistema.
Con quel flag l'app si apre e basta.

Il motivo per cui serve è che ciàcoea **non è notarizzata da Apple**: è firmata, ma con
un certificato nostro, non con un Developer ID. Il codice è quello che è: se preferisci
non fidarti, [scarica il `.dmg`](https://ciacoea.com/scarica/) e sbloccalo a mano.

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
