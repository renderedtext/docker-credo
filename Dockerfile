ARG ELIXIR_IMAGE_TAG=1.13.4-alpine
FROM elixir:$ELIXIR_IMAGE_TAG


RUN apk add --update git && mix local.hex --force
RUN mix archive.install hex bunt --force
RUN mix archive.install hex poison --force
RUN mix archive.install hex credo --force

RUN mkdir -p /home/credo
ADD .credo.exs /home/credo/.credo.exs

VOLUME /home/credo/code
WORKDIR /home/credo/code

ENTRYPOINT ["sh", "-c", "mix credo --strict"]
