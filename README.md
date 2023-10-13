# crystal-docker-quickstart

**crystal-docker-quickstart** provides a project template for quickly working with the [Crystal programming language](https://crystal-lang.org/) in a container, with no installation necessary.

## Usage

1. (Fork and/or) clone this repository, and give it a name for your project: `git clone https://github.com/compumike/crystal-docker-quickstart.git my_app`
1. `cd my_app`
1. Run `./d_dev` to open a bash shell with a Docker container containing this directorye mounted in `/app/` (see source in `/app/src/`, unit tests in `/app/spec/`, and compiled output in `/app/out/`).

Within the Docker container, you may run:

```shell
    # To run unit tests:
    make spec

    # To rebuild your compiled binary, which lives in /app/out/my_app
    make

    # To rebuild the binary, and run it:
    make && out/my_app
```

You may edit your source code from another terminal session or your favorite IDE. (The `d_dev` script mounts this directory into the container.)

Good luck and enjoy! :)

## Next Steps

You may wish to edit some configuration within `Dockerfile`, `d_dev`, or `Makefile`, for example to expose TCP ports, enable compiler release optimizations, or rename your binary to something other than `my_app`.

If you'd like to incorporate a dependency, known as a "Shard" in the crystal world, first edit `shard.yml`, and then run `shards install` within the Docker container.

## Resources

* [Tutorials](https://crystal-lang.org/reference/1.10/tutorials/basics/index.html) - novice
* [Language Reference](https://crystal-lang.org/reference/1.10/syntax_and_semantics/index.html) - intermediate
* [Standard Library Docs](https://crystal-lang.org/api/1.10.1/) - everyday reference material
* [Docs Home](https://crystal-lang.org/reference/1.10/)
* [Forum](https://forum.crystal-lang.org/)
