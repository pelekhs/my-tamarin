FROM ubuntu:latest AS base

RUN set -xe \
	&& apt-get update \
	&& apt-get upgrade -y

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

FROM base AS dependencies

#ENV VERSION 1.6.1
ENV MAUDE_URL http://maude.cs.illinois.edu/w/images/5/5d/Maude-2.7.1-linux.zip

RUN set -xe \
	&& mkdir -p /dependencies \
	&& apt-get install -y curl zip \
	&& curl -q -s -S -L --create-dirs -o maude.zip $MAUDE_URL \
	&& unzip maude.zip -d /dependencies \
	&& mv /dependencies/maude.linux64 /dependencies/maude \
#	&& curl -q -s -S -L --create-dirs -o tamarin.tar.gz https://github.com/tamarin-prover/tamarin-prover/releases/download/$VERSION/tamarin-prover-$VERSION-linux64-ubuntu.tar.gz \
#	&& tar -x -C /dependencies -f tamarin.tar.gz \
	&& chmod -R +x /dependencies

FROM base AS runtime

VOLUME /workspace

COPY . /workspace/

EXPOSE 3001

COPY --from=dependencies /dependencies /usr/local/bin

WORKDIR /workspace

RUN  apt-get install -y curl && curl -sSL https://get.haskellstack.org/ | sh

RUN apt-get install -y build-essential && apt-get install -y make 

RUN make default

RUN set -xe \
	&& addgroup tamarin \
	&& adduser --disabled-password --gecos '' --ingroup tamarin tamarin \
	&& apt-get install -y graphviz libtinfo5 \
	&& apt-get clean

USER tamarin

ENTRYPOINT ["tamarin-prover"]

CMD ["interactive", "."]
