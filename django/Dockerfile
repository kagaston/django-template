FROM oraclelinux:8.2

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN dnf -y update \
  && dnf -y install make \
      automake \
      gcc \
      kernel-devel \
      libpq-devel \
      gettext \
      python3 \
      python3-devel \
      sudo \
  && dnf clean all \
  && alias python=python3 \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && useradd django \
  && echo "django ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

USER django
WORKDIR /opt/project

ARG DEVEL=no

COPY requirements /tmp/requirements

RUN sudo pip3 --no-cache-dir --disable-pip-version-check install --upgrade pip setuptools wheel \
    && if [ "$DEVEL" = "yes" ]; \
        then sudo pip3 --no-cache-dir install -r /tmp/requirements/dev.txt; fi \
    && sudo pip3 --no-cache-dir install -r /tmp/requirements/main.txt \
        $(if [ "$DEVEL" = "yes" ]; then echo '-r /tmp/requirements/tests.txt'; fi)
