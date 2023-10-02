# Define the names/tags of the container
#!BuildTag: toolbox-osc:latest

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
    lnav \
    lua-language-server \
    lua54-luacheck \
    lua54-lyaml \
    luajit \
    mkisofs \
    ncdu \
    neovim \
    obs-service-source_validator \
    openssh-clients \
    osc \
    osc-plugin-staging \
    perl-Perl-Critic \
    perl-Perl-Tidy \
    python313-bashate \
    python313-beautifulsoup4 \
    python313-black \
    python313-lupa \
    python313-mypy \
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
    sle-prjmgr-tools \
    sshfs \
    sudo \
    sysuser-shadow \
    tealdeer \
    tealdeer-bash-completion \
    tig \
    tig-bash-completion \
    tmux \
    uv-bash-completion \
    vgrep \
    vim \
    vim-data \
    wget \
    yq \
    yq-bash-completion \
    zoxide \
    && zypper clean -a
