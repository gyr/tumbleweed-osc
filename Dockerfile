# Define the names/tags of the container
#!BuildTag: distrobox-osc:latest

FROM opensuse/distrobox:latest

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
    bc \
    bind-utils \
    build \
    ca-certificates-suse \
    cpio \
    curl \
    difftastic \
    diffutils \
    dos2unix \
    entr \
    fd \
    fzf \
    fzf-bash-integration \
    gdb \
    git \
    git-delta \
    gnu_parallel \
    iputils \
    jq \
    libvte-2_91-0 \
    lnav \
    lua-language-server \
    lua54-luacheck \
    lua54-lyaml \
    luajit \
    mkisofs \
    ncdu \
    neovim \
    obs-service-obs_scm \
    obs-service-recompress \
    obs-service-set_version \
    obs-service-source_validator \
    obs-service-tar \
    osc \
    osc-plugin-staging \
    perl-Perl-Critic \
    perl-Perl-Tidy \
    python311-packaging \
    python313-rpmfile \
    python313-solv \
    python313-uv \
    ripgrep \
    rpm-build \
    rpmlint \
    rsync \
    ShellCheck \
    StyLua \
    shfmt \
    shadow \
    sle-prjmgr-tools \
    sshfs \
    sudo \
    systemd \
    sysuser-shadow \
    tealdeer \
    tig \
    tmux \
    util-linux \
    vgrep \
    vim \
    vim-data \
    wget \
    yq \
    zoxide \
    && zypper clean -a
