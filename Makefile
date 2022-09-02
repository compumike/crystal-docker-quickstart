all: out/my_app

# CHOOSE ONE:
# Add debugging symbols or not? Makes binaries larger, but can print useful backtraces.
DEBUG=--debug
#DEBUG=--no-debug

# CHOOSE ONE:
# Enabling --release enables compiler optimizations, but makes compilation slower.
RELEASE=
#RELEASE=--release

SOURCES=$(shell find src/ -type f -name '*.cr')
SPECS=$(shell find spec/ -type f -name '*.cr')

BUILD_OPTS=${RELEASE} ${DEBUG} --static --verbose --stats --progress --time --threads 8

out/my_app: $(SOURCES)
	mkdir -p /app/out
	shards install --frozen
	crystal build ${BUILD_OPTS} -o /app/out/my_app src/main.cr

spec: $(SOURCES) $(TEMPLATES) $(SPECS)
	crystal spec --verbose

clean:
	rm -f out/my_app
	rm -rf ~/.cache/crystal/

.PHONY: all spec clean
