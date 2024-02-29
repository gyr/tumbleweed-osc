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
    fd-bash-completion \
    fzf \
    fzf-bash-integration \
    gdb \
    git \
    git-delta \
    git-lfs \
    gnu_parallel \
    iputils \
    jq \
    libcurl4 \
    libvte-2_91-0 \
    lnav \
    lua-language-server \
    lua54-luacheck \
    lua54-lyaml \
    luajit \
    mkisofs \
    ncdu \
    neovim \
    obs-service-download_files \
    obs-service-format_spec_file \
    obs-service-obs_scm \
    obs-service-recompress \
    obs-service-set_version \
    obs-service-source_validator \
    obs-service-tar \
    osc \
    osc-plugin-staging \
    perl-Perl-Critic \
    perl-Perl-Tidy \
    python313-bashate \
    python313-beautifulsoup4 \
    python313-black \
    python313-lupa \
    python313-mypy \
    python313-packaging \
    python313-pylint \
    python313-pyright \
    python313-python-dotenv \
    python313-python-lsp-server \
    python313-python-lsp-server-all \
    python313-rpmfile \
    python313-ruff \
    python313-solv \
    python313-uv \
    python313-yamllint \
    ripgrep \
    ripgrep-bash-completion \
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
    tealdeer-bash-completion \
    tig \
    tig-bash-completion \
    tmux \
    util-linux \
    uv-bash-completion \
    vgrep \
    vim \
    vim-data \
    wget \
    yq \
    yq-bash-completion \
    zoxide \
    && zypper clean -a
