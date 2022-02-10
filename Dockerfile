FROM alpine:edge

ENV TEM /usr/fomtextempl

RUN mkdir -p $TEM \
    && /usr/local/texlive/*/bin/x86_64-linux/tlmgr path add \
    && apk update \
    && apk add --upgrade \
        openjdk17-jre-headless \
        inotify-tools \
        texlive-xetex \
        biblatex \
        texmf-dist-bibtexextra \
        msttcorefonts-installer \
    && update-ms-fonts && fc-cache -f \
    && rm -rf /var/cache/*

WORKDIR $TEM

CMD chmod +x $TEM/*.tex \
    && chmod +x $TEM/app/*.sh \
    && $TEM/app/*.sh
