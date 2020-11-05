FROM fedora:latest

LABEL Name=fomtextemplate Version=0.0.1

RUN useradd -m -p '' bowler

USER root

RUN dnf -y update

# Tools
RUN dnf -y install \
    git \
    vim-X11 \
    inotify-tools \
    java-11-openjdk.x86_64

# Font
RUN dnf -y install curl cabextract xorg-x11-font-utils fontconfig \
    && rpm -i 'https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm'

# LaTeX - essentials
RUN dnf -y install \
    texlive-scheme-basic \
    texlive-arara

# LaTeX - bibliography
RUN dnf -y install \
    texlive-biblatex-ext \
    biber

# LaTeX - packages
RUN dnf -y install \
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

RUN mkdir -p /usr/fomtextemplate/

USER bowler

WORKDIR /usr/fomtextemplate/

CMD chmod +x /usr/fomtextemplate/app/watchfile.sh \
    && /usr/fomtextemplate/app/watchfile.sh