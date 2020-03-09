FROM python:3.8.1-alpine3.11

ARG MKDOCS_HOME=/var/mkdocs_home
ENV MKDOCS_HOME=$MKDOCS_HOME
# Set build directory
WORKDIR /tmp
# Copy files necessary for build
COPY requirements.txt requirements.txt
COPY setup.py setup.py
# Perform build and cleanup artifacts
RUN \
  apk add --no-cache \
    git \
    git-fast-import \
    openssh \
    tar \
  && python setup.py install \
  && rm -rf /tmp/* \
  && pip install --no-cache-dir \
    'mkdocs-minify-plugin>=0.2' \
    'mkdocs-git-revision-date-localized-plugin>=0.4'

# mkdocs home directory is a volume, so configuration and build history
# can be persisted and survive image upgrades
VOLUME $MKDOCS_HOME

WORKDIR /MKDOCS_HOME
COPY docker-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN ln -s /usr/local/bin/entrypoint.sh /
RUN chmod +x /entrypoint.sh
EXPOSE 8000
ENTRYPOINT ["entrypoint.sh"]

