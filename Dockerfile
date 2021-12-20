FROM registry.fedoraproject.org/fedora-minimal:34

LABEL Name=fomtextemplate

ENV DCKR_NAME fomtextemplate
ENV APPL_DIR  /usr/$DCKR_NAME

RUN mkdir -p $APPL_DIR \
    && microdnf -y update \
    && microdnf -y install \
        # os tools
        vim-minimal \
        inotify-tools \
        java-11-openjdk.x86_64 \
            # tex essentials and tools
            texlive-scheme-basic \
            texlive-arara \
            texlive-mdwtools \
            texlive-ifoddpage \
            texlive-texcount \
            texlive-blindtext \
            texlive-hyperref \
            # bibliography
            biber \
            texlive-biblatex-ext \
            texlive-biblatex-ieee \
            # text language
            texlive-babel \
            texlive-babel-german \
            texlive-hyphen-german \
            # toc appendix
            texlive-nomencl \
            texlive-appendix \
            texlive-pdfpages \
            texlive-acronym \
            # page appearance
            texlive-geometry \
            texlive-titlesec \
            texlive-setspace \
            texlive-ragged2e \
            # content appearance
            texlive-caption \
            texlive-enumitem \
            texlive-float \
            texlive-hvfloat \
            texlive-listings \
            texlive-multirow \
            # texlive-nicematrix \
            texlive-threeparttable \
            texlive-topiclongtable \
            # draw content
            texlive-pgf \
            texlive-smartdiagram \
            # footnote
            texlive-footmisc \
            texlive-fnpct \
            texlive-xpatch \
            texlive-units \
            # font
            texlive-anyfontsize \
            texlive-fontspec \
            texlive-newtx \
        curl \
        cabextract \
        xorg-x11-font-utils \
        fontconfig \
        && rpm -i 'https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm' \
    && microdnf clean all

WORKDIR $APPL_DIR

CMD chmod +x $APPL_DIR/app/watchfile.sh && $APPL_DIR/app/watchfile.sh
