#!/usr/bin/env bash

hyperfine \
	--runs 2 \
	--warmup 2 \
	--export-markdown ./bench/parallel.md \
	'node ./Target/lib/parallel.js'

hyperfine \
	--runs 2 \
	--warmup 2 \
	--export-markdown ./bench/piscina.md \
	'node ./Target/lib/piscina.js'

hyperfine \
	--runs 2 \
	--warmup 2 \
	--export-markdown ./bench/serial.md \
	'node ./Target/lib/serial.js'

hyperfine \
	--runs 2 \
	--warmup 2 \
	--export-markdown ./bench/parallel-no-await.md \
	'node ./Target/lib/parallel-no-await.js'

hyperfine \
	--runs 2 \
	--warmup 2 \
	--export-markdown ./bench/piscina-no-await.md \
	'node ./Target/lib/piscina-no-await.js'

hyperfine \
	--runs 2 \
	--warmup 2 \
	--export-markdown ./bench/serial-no-await.md \
	'node ./Target/lib/serial-no-await.js'

{
	printf '# parallel-piscina-benchmark\n'
	printf '\n## Parallel\n'
	cat ./bench/parallel.md
	printf '\n## Piscina\n'
	cat ./bench/piscina.md
	printf '\n## Serial\n'
	cat ./bench/serial.md
	printf '\n## Parallel No Await\n'
	cat ./bench/parallel-no-await.md
	printf '\n## Piscina No Await\n'
	cat ./bench/piscina-no-await.md
	printf '\n## Serial No Await\n'
	cat ./bench/serial-no-await.md
} > README.md
