SHELL=/bin/bash -o pipefail

all: index.bs
	bikeshed spec index.bs index.html

watch:
	rerun bikeshed -i index.html
