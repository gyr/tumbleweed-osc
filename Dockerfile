# Define the names/tags of the container
#!BuildTag: tumbleweed-osc:latest

FROM opensuse/tumbleweed:latest

# Define labels according to https://en.opensuse.org/Building_derived_containers
# labelprefix=org.opensuse.example
PREFIXEDLABEL org.opencontainers.image.title="Tools + osc + Tumbleweed Container"
PREFIXEDLABEL org.opencontainers.image.description="Tumbleweed container base with tools to manage OBS/IBS releases"
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
    osc \
    osc-plugin-staging \
    ripgrep \
    rsync \
    tealdeer \
    tig \
    tmux \
    vgrep \
    vim \
    wget \
    && zypper clean -a
