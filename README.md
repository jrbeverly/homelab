# Homelab

## Summary

A collection of templates and utility scripts used in my homelab. Most of these are just snippets or experiments.

## Getting Started

As most of the scripts are self-contained, you can clone the repository:

```bash
git clone git://homelab/homelab
```

And copy the relevant scripts into `/usr/bin/` (or others) as necessary. You can also skip that, and just copy the contents of a file, then paste it into a fresh `nano` instance.

### Docker-compose

Getting started is as simple as using `docker-compose`. You can do so as such:

```bash
docker-compose up  -d
```

If you wish to upgrade the container stack, you need to run the following commands:

```bash
docker-compose stop
docker-compose rm -v
docker-compose pull
```

You can then start the docker environment.

```bash
docker-compose up  -d
```

## Acknowledgements

The project icon is retrieved from [the Noun Project](docs/icon/icon.json). The original source material has been altered for the purposes of the project. The icon is used under the terms of the [Public Domain](https://creativecommons.org/publicdomain/zero/1.0/).

The project icon is by [Timothy Dilich from the Noun Project](https://thenounproject.com/term/beaker/13604/).