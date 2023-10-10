FROM crystallang/crystal:1.10.0-alpine

RUN apk --update --no-cache add \
  bash \
  ca-certificates \
  tzdata

WORKDIR /app/

COPY ./shard.yml ./shard.lock /app/

RUN shards install --frozen

COPY ./ /app/

RUN make

# If you want to avoid memory spikes due to loading debug symbols when an Exception fires, set CRYSTAL_LOAD_DEBUG_INFO=0.
# See https://github.com/compumike/idle-gc#crystal_load_debug_info0 for more information.
#ENV CRYSTAL_LOAD_DEBUG_INFO=0

# We'll start you off with a bash shell, but you can have the docker image run your compiled binary directly if you wish.
#CMD ["/app/out/my_app"]
CMD ["/bin/bash"]
