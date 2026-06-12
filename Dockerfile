# Define the names/tags of the container
#!BuildTag: toolbox-osc-devel:latest

FROM opensuse/tumbleweed:latest

# Define labels according to https://en.opensuse.org/Building_derived_containers
# labelprefix=org.opensuse.example
PREFIXEDLABEL org.opensuse.base.title="Tools + osc + Tumbleweed Container"
PREFIXEDLABEL org.opensuse.base.description="Tumbleweed container base with tools to manage OBS/IBS releases"
PREFIXEDLABEL org.opensuse.base.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.base.created="%BUILDTIME%"

COPY requirements.txt /opt/
COPY pyproject.toml /opt/

RUN set -euo pipefail; \
    zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed openSUSE:Tools \
    && zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/openSUSE:/infrastructure/openSUSE_Tumbleweed openSUSE:infrastructure \
    && zypper --non-interactive addrepo --refresh https://download.opensuse.org/repositories/SUSE:/CA/openSUSE_Tumbleweed SUSE:CA \
    && zypper --gpg-auto-import-keys refresh  --force --force-build --force-download --services \
    && zypper --non-interactive install --force-resolution -fy \
    bat \
    bats \
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
    gitea-tea \
    gitea-tea-bash-completion \
    gnu_parallel \
    go \
    golangci-lint \
    gopls \
    iputils \
    jq \
    libcurl4 \
    lnav \
    lua-language-server \
    lua54-luacheck \
    lua54-lyaml \
    luajit \
    luajit-lpeg \
    mkisofs \
    ncdu \
    neovim \
    npm \
    obs-git-init \
    obs-service-download_files \
    obs-service-format_spec_file \
    obs-service-kiwi_metainfo_helper \
    obs-service-obs_scm \
    obs-service-product_converter \
    obs-service-recompress \
    obs-service-set_version \
    obs-service-source_validator \
    obs-service-tar \
    openssh-clients \
    osc \
    osc-plugin-staging \
    perl-Perl-Critic \
    perl-Perl-Tidy \
    python313-packaging \
    python313-pip \
    python313-rpmfile \
    python313-solv \
    python313-uv \
    ripgrep \
    ripgrep-bash-completion \
    rpm-build \
    rpmlint \
    rsync \
    rustup \
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
    wcurl \
    yazi \
    yq \
    yq-bash-completion \
    zoxide

# cleanup logs and temporary files
RUN set -euo pipefail; zypper -n clean -a; \
    rm -rf {/target,}/var/log/{alternatives.log,lastlog,tallylog,zypper.log,zypp/history,YaST2}; \
    rm -rf {/target,}/run/*; \
    rm -f {/target,}/etc/{shadow-,group-,passwd-,.pwd.lock}; \
    rm -f {/target,}/usr/lib/sysimage/rpm/.rpm.lock; \
    rm -f {/target,}/var/cache/ldconfig/aux-cache; \
    command -v zypper >/dev/null 2>&1 || rm -f /var/lib/zypp/AutoInstalled
