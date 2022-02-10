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

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \ 
    tar xzf install-tl-unx.tar.gz && rm install-tl-unx.tar.gz && \ 
    cd install-tl* && \ 
    echo "selected_scheme scheme-basic" > install.profile && \ 
    echo "tlpdbopt_install_docfiles 0" >> install.profile && \ 
    echo "tlpdbopt_install_srcfiles 0" >> install.profile && \
    echo "tlpdbopt_autobackup 0" >> install.profile && \ 
    echo "tlpdbopt_sys_bin /usr/bin" >> install.profile && \
    ./install-tl -profile install.profile && cd .. && rm -rf install-tl*
    
RUN /usr/local/texlive/*/bin/x86_64-linux/tlmgr path add

WORKDIR $TEM

CMD chmod +x $TEM/*.tex \
    && chmod +x $TEM/app/*.sh \
    && $TEM/app/*.sh
