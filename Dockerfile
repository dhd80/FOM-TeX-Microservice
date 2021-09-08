FROM registry.fedoraproject.org/fedora-minimal:latest

LABEL Name=fomtextemplate

ENV DCKR_NAME fomtextemplate
ENV APPL_DIR  /usr/$DCKR_NAME
ENV USER_NAME bowler

# User # Dir # Update # Tools # LaTeX - essentials # LaTeX - bibliography # LaTeX - packages # Font
RUN useradd -m -p '' $USER_NAME \
    && mkdir -p $APPL_DIR \
    && microdnf -y update \
    && microdnf -y install \
        vim-minimal \
        inotify-tools \
        java-11-openjdk.x86_64 \
            biber \
            texlive-scheme-basic \
            texlive-arara \
            texlive-acronym \
            texlive-biblatex-ext \
            texlive-biblatex-ieee \
            texlive-babel \
            texlive-babel-german \
            texlive-nomencl \
            texlive-geometry \
            texlive-float \
            texlive-fancyhdr \
            texlive-fancybox \
            texlive-setspace \
            texlive-polyglossia \
            texlive-anyfontsize \
            texlive-pdfpages \
            texlive-appendix \
            texlive-fontspec \
            texlive-ragged2e \
            texlive-caption \
            texlive-hvfloat \
            texlive-footmisc \
            texlive-fnpct \
            texlive-enumitem \
            texlive-multirow \
            texlive-colortbl \
            texlive-hyperref \
            texlive-blindtext \
            texlive-listings \
            texlive-topiclongtable \
            texlive-threeparttable \
            texlive-mdwtools \
            texlive-units \
            texlive-newtx \
            texlive-titlesec \
            texlive-ifoddpage \
            texlive-xpatch \
            texlive-pdfsync \
            texlive-texcount \
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
