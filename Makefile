PKG=websocket
PREFIX=`opam config var prefix`
BUILDOPTS=native=true native-dynlink=true lwt=false async=true async_ssl=true nocrypto=true cryptokit=false test=true

all: build

build:
	ocaml pkg/build.ml $(BUILDOPTS)

install: build
	opam-installer --prefix=$(PREFIX) $(PKG).install

uninstall: $(PKG).install
	opam-installer -u --prefix=$(PREFIX) $(PKG).install

PHONY: clean

clean:
	ocamlbuild -clean
