ARG BASE_IMAGE

# run-base image
FROM ${BASE_IMAGE} AS run-base

ARG cnb_uid=1000
ARG cnb_gid=1000
ARG distro_name="Amazon Linux"
ARG distro_version="2"
ARG homepage=$GIT_REPO
ARG maintainer=$MAINTAINER
ARG stack_id="io.buildpacks.stacks.amazonlinux"
ARG description="Amazon Linux 2 stack"
ARG metadata=""
ARG mixins=""
ARG released=""
ARG package_metadata=""

LABEL MAINTAINER=$MAINTAINER
LABEL GIT_REPO=$GIT_REPO

RUN <<EOF
yum update -y
yum install -y \
  ca-certificates \
  gnupg \
  gzip \
  libyaml \
  openssl11 \
  openssl11-libs \
  shadow-utils \
  tar \
  tzdata \
  unzip \
  zip \
  zlib-devel

yum clean all
rm -rf /var/cache/yum

EOF

# run-base-cnb image
FROM run-base AS run-base-cnb

RUN groupadd cnb --gid ${cnb_gid} \
  && useradd --uid ${cnb_uid} --gid ${cnb_gid} -m -s /bin/bash cnb

LABEL io.buildpacks.stack.description=${description}
LABEL io.buildpacks.stack.distro.name=${distro_name}
LABEL io.buildpacks.stack.distro.version=${distro_version}
LABEL io.buildpacks.stack.homepage=${homepage}
LABEL io.buildpacks.stack.id=${stack_id}
LABEL io.buildpacks.stack.maintainer=${maintainer}
LABEL io.buildpacks.stack.metadata=${metadata}
LABEL io.buildpacks.stack.mixins=${mixins}
LABEL io.buildpacks.stack.released=${released}
LABEL io.paketo.stack.packages=${package_metadata}

USER ${cnb_uid}:${cnb_gid}

# build-base image
FROM run-base AS build-base

# This includes all packages needed to install python from source
RUN <<EOF
yum update -y
yum install -y \
  bzip2-devel \
  bluez-libs-devel \
  curl \
  gcc \
  git \
  gdbm-devel \
  glibc-devel \
  gmp-devel \
  expat-devel \
  jq \
  kernel-devel \
  libffi-devel \
  libtirpc-devel \
  make \
  ncurses-devel \
  nss-devel \
  openssl11-devel \
  pax \
  readline-devel \
  sqlite-devel \
  tcl-devel \
  tk-devel \
  util-linux \
  uuid-devel \
  wget \
  xz-libs \
  zlib-devel

yum clean all
rm -rf /var/cache/yum

YJ_URL=https://github.com/sclevine/yj/releases/download/v5.1.0/yj-linux-amd64

if [ $(arch) = "aarch64" ]; then
  YJ_URL=https://github.com/sclevine/yj/releases/download/v5.1.0/yj-linux-arm64
fi

# Install yj (no checksums available)
curl -sSL "$YJ_URL" > /usr/local/bin/yj && chmod +x /usr/local/bin/yj

EOF

# build-base-cnb image
FROM build-base AS build-base-cnb

RUN groupadd cnb --gid ${cnb_gid} \
  && useradd --uid ${cnb_uid} --gid ${cnb_gid} -m -s /bin/bash cnb

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}
ENV CNB_STACK_ID=${stack_id}

LABEL io.buildpacks.stack.description=${description}
LABEL io.buildpacks.stack.distro.name=${distro_name}
LABEL io.buildpacks.stack.distro.version=${distro_version}
LABEL io.buildpacks.stack.homepage=${homepage}
LABEL io.buildpacks.stack.id=${stack_id}
LABEL io.buildpacks.stack.maintainer=${maintainer}
LABEL io.buildpacks.stack.metadata=${metadata}
LABEL io.buildpacks.stack.mixins=${mixins}
LABEL io.buildpacks.stack.released=${released}
LABEL io.paketo.stack.packages=${package_metadata}

USER ${cnb_uid}:${cnb_gid}
