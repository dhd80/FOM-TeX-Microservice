FROM registry.fedoraproject.org/fedora-minimal:latest

LABEL Name=fomtextemplate

ENV DCKR_NAME fomtextemplate
ENV APPL_DIR  /usr/$DCKR_NAME
ENV USER_NAME bowler

RUN useradd -m -p '' $USER_NAME \
    && mkdir -p $APPL_DIR \
    && microdnf -y update \
    && microdnf -y install \
        # os tools
        vim-minimal \
        inotify-tools \
        java-11-openjdk.x86_64 \
            # tex essentials and tools
            texlive-scheme-basic \
            texlive-arara \
            texlive-xpatch \
            texlive-mdwtools \
            texlive-ifoddpage \
            texlive-hyperref \
            texlive-texcount \
            texlive-blindtext \
            # bibliography
            biber \
            texlive-biblatex-ext \
            texlive-biblatex-ieee \
            # text language
            texlive-babel \
            texlive-babel-german \
            texlive-hyphen-german \
            # toc, appendix etc
            texlive-nomencl \
            texlive-appendix \
            texlive-pdfpages \
            # page appearance
            texlive-geometry \
            texlive-colortbl \
            texlive-titlesec \
            texlive-fancyhdr \
            texlive-fancybox \
            texlive-setspace \
            texlive-ragged2e \
            # content apperance
            texlive-acronym \
            texlive-caption \
            texlive-enumitem \
            texlive-float \
            texlive-hvfloat \
            texlive-listings \
            texlive-multirow \
            texlive-threeparttable \
            texlive-topiclongtable \
            # footnote
            texlive-footmisc \
            texlive-fnpct \
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

USER $USER_NAME

WORKDIR $APPL_DIR

CMD chmod +x $APPL_DIR/app/watchfile.sh \
    && $APPL_DIR/app/watchfile.sh
