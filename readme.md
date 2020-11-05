# FOM Tex Template

Eine LaTeX-Vorlage für den persönlichen Gebrauch für Scientific Essays, Haus-, Seminar-, Bachelor und Master-Arbeiten an der FOM Hochschule für Oekonomie & Management.

Dieses Tex Template ist eine sehr stark angepasst Version von Andy Grunwald's wunderbarem [FOM-LaTeX-Template](https://github.com/andygrunwald/FOM-LaTeX-Template) 
Anpassungen basieren auf den Rückmeldungen der Professoren.

## Leitfaden
Gestaltungsleitfaden 2018

## How it works
Dieses dockerized LaTeX Template soll einen Docker (am besten im Hintergrund) starten und jedesmal wenn die Datei _deine_inhalte/Kapitel.tex_ gespeichert wird, wird diese mit [_arara_](https://github.com/cereda/arara) kompiliert. Danach wartet das Skript 2 Sekunden. Ein Kompilierungslauf dauert 15-22 Sekunden, da LaTeX und BibLaTeX einen mehrmaligen Durchlauf benötigen.

## Installation 
installiere [Docker for Mac](https://docs.docker.com/docker-for-mac/install) Das Template wurde bisher nur macOS getestet, andere OS sollten aber auch funktionieren.

## Verwendung
### Docker
1. klone dieses Repository mit ``git clone https://github.com/dhd80/DockerizedFOMLaTeXTemplate.git``

2. gehe in den Ordner dieses Repository

3. baue den Docker mit folgendem Befehl:

``
docker Bild --pull --rm -f "Dockerfile" -t \
	fomtextemplate:latest "."
``

4. starte den Docker mit folgendem Befehl:

``
docker run -d \
    --name fomtextemplate \
    -v {$PWD}:/usr/fomtextemplate:rw \
    fomtextemplate:latest
``

Je nachdem welche Shell du nutzt, musst du ``{$PWD}`` in ``${PWD}`` ändern. Es wird eine _thesis.pdf_ neben der _thesis.tex_ erzeugt.

### Ohne Docker
du kannst das Template kompilieren wenn du in deinem Terminal folgenden Befehl nutzt: ``arara thesis.tex`` Es wird eine thesis.pdf neben der _thesis.tex_ erzeugt.

## Mein Workflow (Empfehlungen)
### Software
[Visual Studio Code](https://code.visualstudio.com/download)
[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
[LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities)
[Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright)
[vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)

### Bibliographie
unter [zbib.org](https://zbib.org) kannst du die ISBNs deiner Bücher eingeben und eine BibLaTeX Datei downloaden, mit dem Namen _citations.bib_. Diese .bib kannst du einfach unter _deine_inhalte/_ überschreiben und nutzen. Im selben Verzeichnis liegt _citations_manual.bib_ diese kannst du nutzen um eigene Einträge zu setzen, bspw. wenn die auto. generierten unsauber aufbereitet sind. Es werden also beide .bib gleichzeitig von der Vorlage genutzt.

#### Flüchtige Quellen
du kannst flüchtige Quellen mit wget von deinem Terminal aus downloaden, siehe https://www.linuxjournal.com/content/downloading-entire-web-site-wget

## Fehlerhandling
_arara_ säubert diverse auxiliary files vor und nach dem Kompilierungslauf, was diversen Fehlern vorbeugt. Sollte ein Fehler auftreten, kompiliere mit ``arara -lv thesis.tex`` direkt im Docker, was eine weitere Logdatei erzeugt, aber auch mehr Output auf deinem Terminal, u.a. in Form von Fehlermeldungen.

## Getestet unter
macOS.

## To do
Umstellen auf Alpine, CI, watch entire deine_inhalten, neuen Leitfaden nutzen, andere OS testen, Docker-Compose?

## Disclaimer
Solltest du dieses Template nutzen wollen, plane genug Zeit ein und teste es vorher aus. Bespreche mit deinem Betreuer das Format, da mehrere Zitierstil im Umlauf sind und manche Betreuer speziellere Vorgaben machen. Gerne Antworte ich auf Anfragen, hier in GitHub. Ich kann jedoch keine Aussage über die Reaktionszeit treffen. Dies ist ein privates Projekt und die Nutzung auf eigene Gefahr. Diese Vorlage hat weder einen Anspruch auf Richtigkeit, noch auf Vollständigkeit. Verbesserungen sind jederzeit willkommen.

## Lizenz
Dieses Projekt ist unter den Bedingungen der [MIT Lizenz](http://en.wikipedia.org/wiki/MIT_License) öffentlich verfügbar.
