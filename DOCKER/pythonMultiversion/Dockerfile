ARG IMG_NAME
ARG VERSION

# FROM ubuntu:22.04
FROM ${IMG_NAME}:${VERSION}

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies.
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    git \
    ca-certificates \
    libffi-dev \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -f /var/cache/apt/archives/*.deb

# Install ``pyenv``.
RUN git clone https://github.com/pyenv/pyenv /root/.pyenv

# Install the desired versions of Python.
# ARG PYTHON_VERSIONS='3.8.16 3.9.16 3.10.10 3.11.2 pypy3.9-7.3.11'
ARG PYTHON_VERSIONS='2.7.17 3.11.2'
RUN for PYTHON_VERSION in ${PYTHON_VERSIONS}; do \
  set -ex \
    && /root/.pyenv/bin/pyenv install ${PYTHON_VERSION} \
    && /root/.pyenv/versions/${PYTHON_VERSION}/bin/python -m pip install --upgrade pip \
  ; done

# Add to PATH, in order of lowest precedence to highest.
ENV PATH /root/.pyenv/versions/2.7.17/bin:${PATH}
ENV PATH /root/.pyenv/versions/3.11.2/bin:${PATH}
# RUN for PYTHON_VERSION in ${PYTHON_VERSIONS} ; do \
#   ENV PATH /root/.pyenv/versions/${PYTHON_VERSION}/bin:${PATH} \
#   ; done

###personal config
RUN apt update && apt install -y nano ffmpeg \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -f /var/cache/apt/archives/*.deb
RUN pip install --upgrade pip

COPY createStructureProjects.sh /SCRIPTS/
WORKDIR /usr/src/app

CMD ["python3.11"]