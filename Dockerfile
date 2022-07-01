# Define the names/tags of the container
#!BuildTag: distrobox-osc:latest

FROM opensuse/tumbleweed:latest

# Define labels according to https://en.opensuse.org/Building_derived_containers
# labelprefix=org.opensuse.example
PREFIXEDLABEL org.opencontainers.image.title="Tools + osc + Distrobox Container"
PREFIXEDLABEL org.opencontainers.image.description="Distrobox container base with tools to manage OBS/IBS releases"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"

RUN zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed openSUSE:Tools \
    && zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/infrastructure/openSUSE_Tumbleweed openSUSE:infrastructure \
    && zypper --gpg-auto-import-keys refresh \
    && zypper --non-interactive in --no-recommends --force-resolution -fy \
    bat \
    bc \
    build \
    ca-certificates-suse \
    curl \
    diffutils \
    dos2unix \
    fd \
    fzf \
    fzf-bash-completion \
    git \
    git-delta \
    gnu_parallel \
    iputils \
    libvte-2_91-0 \
    lnav \
    mktemp \
    ncdu \
    obs-service-source_validator \
    osc \
    osc-plugin-staging \
    ripgrep \
    rsync \
    shadow \
    sudo \
    systemd \
    tealdeer \
    tig \
    tmux \
    util-linux \
    vgrep \
    vim \
    vim-data \
    wget \
    && zypper clean -a
