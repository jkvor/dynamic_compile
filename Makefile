ERL_SOURCES := $(wildcard src/*.erl)
ERL_OBJECTS := $(ERL_SOURCES:%.erl=./%.beam)

all: $(ERL_OBJECTS)

clean:
	rm -rf ebin/*.beam erl_crash.dump

./%.beam: %.erl
	@mkdir -p ebin
	erlc +debug_info -I include -o ebin $<