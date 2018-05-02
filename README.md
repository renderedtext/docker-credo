# Dockerized Credo

Based on [platformatec/engine-credo](https://github.com/plataformatec/engine-credo).

Lint your elixir code with:

``` bash
docker run -v $(PWD):/home/credo/code -t renderedtext/credo
```

Lint only one file:

``` bash
docker run -v $(PWD):/home/credo/code -t renderedtext/credo mix credo <file-path>
```

Explain reason of failure:

``` bash
docker run -v $(PWD):/home/credo/code -t renderedtext/credo mix credo explain <file-path>
```

### TODOS

- [ ] Continuous delivery
