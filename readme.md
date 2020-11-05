# FOM Tex Template

Eine LaTeX-Vorlage für den persönlichen Gebrauch für Haus-, Seminar-, Bachelor, Master-Arbeiten und Scientific Essays an der FOM Hochschule für Oekonomie & Management.

Diese Tex Template ist eine sehr stark angepasst Version von Andy Grunwald's wunderbarem [FOM-LaTeX-Template](https://github.com/andygrunwald/FOM-LaTeX-Template) Anpassungen basierend auf den Rückmeldungen der Professoren.

## Leitfaden
Bisher noch Gestaltungsleitfaden 2018

## How it works
Dieses dockerized Template soll einen Docker (am besten im Hintergrund) starten und jede mal wenn die Datei _deine_inhalte/Kapitel.tex_ gespeichert wird, wird diese mit [_arara_](https://github.com/cereda/arara) kompiliert. Danach wartet das Skript 25 Sekunden, da ein Komilierungslauf 15-22 Sekunden dauert, danach kann wieder kompiliert werden.

## Installation 
installiere [Docker fo Mac](https://docs.docker.com/docker-for-mac/install/) Template wurde bisher nur macOS getestet, andere OS sollten aber auch funktionieren.

## Verwendung
### Docker

1. clone dieses Repository

2. gehe in den Ordner dieses Repository

3. baue den Docker mit folgendem Befehl:
``docker build --pull --rm -f "Dockerfile" -t \
	fomtextemplate:latest "."``

4. starte den Docker mit folgendem Befehl:
``docker run -d \
    --name fomtextemplate \
    -v {$PWD}:/usr/fomtextemplate:rw \
    fomtextemplate:latest``
Je nachdem welche Shell du nutzt, musst du ggf. ``{$PWD}`` in ``${PWD}`` ändern. Es wird eine _thesis.pdf_ neben der thesis.tex erzeugt.

### Ohne Docker
du kannst das Template kompilieren wenn du in deinem Terminal folgenden Befehl nutzt:
``arara thesis.tex`` Es wird eine thesis.pdf neben der thesis.tex erzeugt.

## Mein workflow (Empfehlungen)
### Bibliographie
unter https://zbib.org kannst du die ISBNs deiner Bücher eingeben und eine BibTex Datei downloaden, mit dem namen _citations.bib_. Diese .bib kannst du einfach unter _deine_inhalte/_ überschreiben und nutzen. Im selben Verzeichnis liegt _citations_manual.bib_ diese kannst du nutzen um eigene Einträge zu setzen, bspw. wenn die auto. generierten unsauber aufbereitet sind. Es werden also beide .bib gleichzeitig von der Vorlage genutzt.

#### Flüchtige Quellen
du kannst flüchtige Quellen mit wget von deinem Terminal aus downloaden, siehe https://www.linuxjournal.com/content/downloading-entire-web-site-wget

## Fehlerhandling
_arara_ cleanes diverse auxiliary-Files vor und nach dem Kompilierungslauf, was diversen Fehlern vorbeugt. Sollte ein Fehler autreten, versuche direkt im Docker zum kompilieren mit ``arara -lv thesis.tex`` was eine weitere Logdatei erzeugt, aber auch mehr Output auf deinem Terminal, u.a. in Form von Fehlermedlungen.

## Getestet unter
macOS.

## To do
Umstellen auf Alpine, CI, gesamten Ordner deine_inhalten watchen, neuen Leitfaden nutzen, andere OS testen, Docker-Compose?

## Disclaimer
Solltest du dieses Template nutzen wollen, plane genug Zeit ein und teste es vorher aus. Bespreche mit dinem Betreuer das Format, da mehrere Zitierstiele im Umlauf sind und manche Betreuer speziellere Vorgaben machen. Gerne Antworte ich auf Anfragen, hier in GitHub. Ich kann jedoch keine Aussage über die Reaktionszeit treffen. Dies ist ein privates Projekt und die Nutzung auf eigene Gefahr. Diese Vorlage hat weder einen Anspruch auf Richtigkeit, noch auf Vollständigkeit. Verbesserungen sind jederzeit willkommen.

## Lizens
Dieses Projekt ist unter den Bedingungen der [MIT Lizenz](http://en.wikipedia.org/wiki/MIT_License) öffentlich verfügbar.

