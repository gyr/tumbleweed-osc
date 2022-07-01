# Define the names/tags of the container
#!BuildTag: toolbox-osc:latest

FROM opensuse/tumbleweed:latest

# Define labels according to https://en.opensuse.org/Building_derived_containers
# labelprefix=org.opensuse.example
PREFIXEDLABEL org.opencontainers.image.title="Tools + osc + Toolbox Container"
PREFIXEDLABEL org.opencontainers.image.description="Toolbox container base with tools to manage OBS/IBS releases"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"

RUN zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed openSUSE:Tools \
    && zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/infrastructure/openSUSE_Tumbleweed openSUSE:infrastructure \
    && zypper --gpg-auto-import-keys refresh \
    && zypper --non-interactive in --no-recommends --force-resolution -fy \
    bat \
    build \
    ca-certificates-suse \
    curl \
    dos2unix \
    fd \
    fzf \
    fzf-bash-completion \
    git \
    git-delta \
    gnu_parallel \
    iputils \
    lnav \
    mktemp \
    ncdu \
    obs-service-source_validator \
    osc \
    osc-plugin-staging \
    ripgrep \
    rsync \
    sudo \
    tealdeer \
    tig \
    tmux \
    vgrep \
    vim \
    vim-data \
    wget \
    && zypper clean -a
