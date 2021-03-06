FROM ruby:2.5-slim
LABEL maintainer "@c-nagy"

ARG COMMIT=8876f69ba618c5872b3fb1bbe543892ad05de54e

ENV LANG="C.UTF-8" \
    DEPS="build-essential \
          libsqlite3-dev \
          libcurl4-openssl-dev \
          vim-common vim-runtime \
          wget"

RUN apt-get update \
  && apt-get install -y $DEPS \
                        sqlite3 \
                        nodejs \
  && useradd -m beef \
  && wget -q https://github.com/beefproject/beef/tarball/$COMMIT -O beef.tgz \
  && mkdir /home/beef/beef \
  && tar -xzf beef.tgz --strip 1 -C /home/beef/beef \
  && cd /home/beef/beef \
  && wget -q https://raw.githubusercontent.com/c-nagy/beef/master/config.yaml -O config.yaml \
  && wget -q https://raw.githubusercontent.com/c-nagy/beef/master/autoattack.json -O arerules/enabled/autoattack.json \
  && chown -R beef:beef /home/beef \
  && bundle install --without test development

WORKDIR /home/beef/beef

USER beef

EXPOSE 443 6789 61985 61986

COPY entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
