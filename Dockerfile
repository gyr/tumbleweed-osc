# Define the names/tags of the container
#!BuildTag: tumbleweed-osc:latest

FROM opensuse/tumbleweed:latest

# Define labels according to https://en.opensuse.org/Building_derived_containers
# labelprefix=org.opensuse.example
PREFIXEDLABEL org.opensuse.base.title="Tools + osc + Tumbleweed Container"
PREFIXEDLABEL org.opensuse.base.description="Tumbleweed container base with tools to manage OBS/IBS releases"
PREFIXEDLABEL org.opensuse.base.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.base.created="%BUILDTIME%"

RUN zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed openSUSE:Tools \
    && zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/infrastructure/openSUSE_Tumbleweed openSUSE:infrastructure \
    && zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/SUSE:/CA/openSUSE_Tumbleweed SUSE:CA \
    && zypper --gpg-auto-import-keys refresh  --force --force-build --force-download --services \
    && zypper --non-interactive in --force-resolution -fy \
    bat \
    bind-utils \
    build \
    ca-certificates-suse \
    curl \
    difftastic \
    dos2unix \
    entr \
    fd \
    fzf \
    fzf-bash-completion \
    gdb \
    git \
    git-delta \
    gnu_parallel \
    iputils \
    jq \
    lnav \
    mktemp \
    ncdu \
    obs-service-source_validator \
    osc \
    osc-plugin-staging \
    python3-solv \
    python311-black \
    python311-pylint \
    python311-rpmfile \
    python311-yamllint \
    ripgrep \
    rpm-build \
    rsync \
    sle-prjmgr-tools \
    sshfs \
    sysuser-shadow \
    tealdeer \
    tig \
    tmux \
    vgrep \
    vim \
    vim-data \
    wget \
    yq \
    && zypper clean -a
