VERSION=0.1
LIBDIR=`erl -eval 'io:format("~s~n", [code:lib_dir()])' -s init stop -noshell`
ERL_SOURCES := $(wildcard src/*.erl)
ERL_OBJECTS := $(ERL_SOURCES:%.erl=./%.beam)

all: $(ERL_OBJECTS)

clean:
	rm -rf ebin/*.beam erl_crash.dump
	
install:
	mkdir -p $(prefix)/$(LIBDIR)/dynamic_compile-$(VERSION)/ebin
	for i in ebin/*.beam; do install $$i $(prefix)/$(LIBDIR)/dynamic_compile-$(VERSION)/$$i ; done

./%.beam: %.erl
	@mkdir -p ebin
	erlc +debug_info -I include -o ebin $<