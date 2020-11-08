FROM fedora:latest

LABEL Name=fomtextemplate Version=0.0.1

USER root

# User # Dir # Update # Font # Tools # LaTeX - essentials # LaTeX - bibliography # LaTeX - packages
RUN useradd -m -p '' bowler \
    && mkdir -p /usr/fomtextemplate/ \
    && dnf -y update \
    && dnf -y install \
        curl \
        cabextract \
        xorg-x11-font-utils \
        fontconfig \
        && rpm -i 'https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm' \
        && dnf -y install \
            vim-X11 \
            inotify-tools \
            java-11-openjdk.x86_64 \
                biber \
                texlive-scheme-basic \
                texlive-arara \
                texlive-biblatex-ext \
                texlive-babel \
                texlive-babel-german \
                texlive-geometry \
                texlive-float \
                texlive-fancyhdr \
                texlive-fancybox \
                texlive-setspace \
                texlive-polyglossia \
                texlive-pdfpages \
                texlive-appendix \
                texlive-fontspec \
                texlive-ragged2e \
                texlive-caption \
                texlive-hvfloat \
                texlive-footmisc \
                texlive-enumitem \
                texlive-multirow \
                texlive-rotating \
                texlive-colortbl \
                texlive-hyperref \
                texlive-blindtext \
                texlive-listings \
                texlive-nomencl \
                texlive-topiclongtable \
                texlive-mdwtools \
                texlive-units \
                texlive-newtx \
                texlive-titlesec \
                texlive-ifoddpage \
                texlive-xpatch

USER bowler

WORKDIR /usr/fomtextemplate/

CMD chmod +x /usr/fomtextemplate/app/watchfile.sh \
    && /usr/fomtextemplate/app/watchfile.sh
