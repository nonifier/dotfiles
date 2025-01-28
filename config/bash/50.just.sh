#!/usr/bin/bash

## if the binary 'just' is executable, then, load the autocompletion of just --autocompletions bash
if [[ -x $(command -v just) ]]; then
    source <(just --completions bash)
fi
