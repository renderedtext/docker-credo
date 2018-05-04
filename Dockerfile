FROM elixir:1.5.1-alpine
MAINTAINER Rendered Text <devs@renderedtext.com>

ENV MIX_ENV test

RUN apk add --update git && mix local.hex --force

RUN mix archive.install hex bunt 0.2.0 --force
RUN mix archive.install hex poison --force
RUN mix archive.install hex credo 0.9.2 --force

RUN mkdir -p /home/credo
ADD .credo.exs /home/credo/.credo.exs

VOLUME /home/credo/code
WORKDIR /home/credo/code

CMD ["sh", "-c", "mix credo --strict"]
