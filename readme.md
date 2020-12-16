# FOM TeX Template Microservice

Eine LaTeX-Vorlage für den persönlichen Gebrauch für Scientific Essays, Haus-, Seminar-, Bachelor- und Master-Arbeiten an der FOM Hochschule für Oekonomie & Management.

Dieses TeX Template ist eine sehr stark angepasst Version von Andy Grunwald's wunderbarem [FOM-LaTeX-Template](https://github.com/andygrunwald/FOM-LaTeX-Template). Anpassungen basieren auf den Rückmeldungen der Dozenten.

## Features
Template mit **Microservice** Charakter. **Automatisch** da während des Schreibens, die PDF kompiliert wird. Echte Einbindung von **Times New Roman** als Systemschrift, denn die meisten TeX-Templates nutzen nur eine ähnliche Schriftart und nicht das Original. **Keine Systeminstallation** von LaTeX notwendig, da LaTeX automatisch im Docker installiert wird. **Platzsparend** da nur die notwendigen TeX-Pakete installiert werden (~1.2GB).

## How it works
Dieser dockerized LaTeX Template Microservice, soll einen Docker (am besten im Hintergrund) starten und jedesmal wenn die Datei _**deine_inhalte/Kapitel.tex**_ gespeichert wird, wird diese  _**automatisch**_ mit [_arara_](https://github.com/cereda/arara) kompiliert. Ein Kompilierungslauf dauert ~20 Sekunden, da LaTeX und BibLaTeX einen mehrmaligen Durchlauf benötigen.

## Leitfaden
Gestaltungsleitfaden 2020

## Installation 
Installiere [Docker](https://docs.docker.com/get-docker/) für dein Betriebssystem.

## Verwendung
### Vorbereitung
1. klone dieses Repository in deinem Terminal, mit dem Befehl

    ``git clone https://github.com/dhd80/FOM-TeX-Microservice.git``

2. gehe in den Ordner dieses Repository mit 
    ``cd FOM-TeX-Microservice``

### Mit Docker
#### Via Docker-Compose (Empfohlen)
benutze einfach
    
    docker-compose up

~ fertig! 🤓 Oder starte wahlweise mit oder ohne Terminal (inkl. min. Fehlerhandling)
- Ohne, also im Hintergrund:
    
    ``docker-compose up --detach --build --remove-orphans``

- Mit, also im Vordergrund:
  
    ``docker-compose up --build --remove-orphans``

![Terminal](.github/terminal.png)

#### Via Dockerfile
1. baue den Docker mit folgendem Befehl:

    ``docker build --pull --rm -f "Dockerfile" -t fomtextemplate:latest "."``

2. starte den Docker mit folgendem Befehl:

    ``docker run -d --name fomtextemplate -v {$PWD}:/usr/fomtextemplate:rw fomtextemplate:latest``

Je nachdem welche Shell du nutzt, musst du ``{$PWD}`` in ``${PWD}`` ändern. Es wird eine _elaborat.pdf_ neben der _elaborat.tex_ erzeugt.

### Ohne Docker
Hierbei wird natürlich eine LaTeX Installation und alle benötigten Pakete auf deinem System erwartet. Du kannst das Template kompilieren, wenn du in deinem Terminal folgenden Befehl nutzt: ``arara elaborat.tex`` Es wird eine _elaborat.pdf_ neben der _elaborat.tex_ erzeugt.

## Mein Workflow (Empfehlungen)
### Software
[Visual Studio Code](https://code.visualstudio.com/download) - 
[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) - 
[LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) - 
[Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright) - 
[vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)

### Bibliographie
Unter [zbib.org](https://zbib.org) kannst du die ISBNs deiner Bücher eingeben und eine BibLaTeX Datei downloaden, mit dem Namen _citations.bib_. Diese .bib kannst du einfach unter _deine_inhalte/_ überschreiben und nutzen. Im selben Verzeichnis liegt _citations_manual.bib_ diese kannst du nutzen um eigene Einträge zu setzen, bspw. wenn die auto. generierten unsauber aufbereitet sind. Es werden also beide .bib gleichzeitig von der Vorlage genutzt.

#### Flüchtige Quellen
Du kannst flüchtige Quellen mit wget von deinem Terminal aus downloaden, siehe https://www.linuxjournal.com/content/downloading-entire-web-site-wget

#### Wörter zählen
Bei jedem Lauf wird die Datei _word_count.log_ erstellt/überschrieben, in welcher du die Anzahl deiner geschriebenen Worte ablesen kannst.

## Fehlerhandling
_arara_ säubert diverse auxiliary files vor und nach dem Kompilierungslauf, was diversen Fehlern vorbeugt. Sollte ein Fehler auftreten, kompiliere mit ``arara -lv elaborat.tex`` direkt im Docker, was eine weitere Logdatei erzeugt, aber auch mehr Output auf deinem Terminal, u.a. in Form von Fehlermeldungen.

## Getestet unter
Das Template wurde bisher nur unter macOS getestet, andere OS sollten aber auch funktionieren.

## To do
Andere OS testen, cleanup TeX, cleanup cites, fancy* Pakete loswerden, überflüssige Pakete identifizieren.

## Disclaimer
Solltest du dieses Template nutzen wollen, plane genug Zeit ein und teste es vorher aus. Bespreche mit deinem Betreuer das Format, da mehrere Zitierstile im Umlauf sind und manche Betreuer speziellere Vorgaben machen. Gerne Antworte ich auf Anfragen, hier in GitHub. Ich kann jedoch keine Aussage über die Reaktionszeit treffen. Dies ist ein privates Projekt und die Nutzung auf eigene Gefahr. Diese Vorlage hat weder einen Anspruch auf Richtigkeit, noch auf Vollständigkeit. Verbesserungen sind jederzeit willkommen.

## Lizenz
Dieses Projekt ist unter den Bedingungen der [MIT Lizenz](http://en.wikipedia.org/wiki/MIT_License) öffentlich verfügbar.
