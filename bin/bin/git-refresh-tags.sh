#!/bin/bash
#
# Generates useful files for code navigation within a git repository

toplevel=$(git rev-parse --show-toplevel 2> /dev/null)
if [[ "$?" != "0" ]]; then
    echo "Run this script from within a git repository." >&2
    exit 1
fi

echo -n "Refreshing tag files..."

# ctags file
which ctags > /dev/null 2>&1 && ctags -R -f "${toplevel}/.tags"

# cscope database
which cscope > /dev/null 2>&1 && \
    mkdir -p "${toplevel}/.cscope" && \
    cscope -R -q -b -f "${toplevel}/.cscope/cscope.out"

# Useful for file navigation via Vim's CtrlP plugin
touch "${toplevel}/.ctrlp.root"

# Ignore file for the Silver Searcher
echo "build" > "${toplevel}/.agignore"

# Add a local .vimrc which registers the cscope database
# Note: Automatically sourcing a .vimrc file in the current directory is NOT
# default Vim behavior.  See the main vimrc file in this rcfiles repo for
# code which automatically sources a local .vimrc file.
echo "silent cscope add .cscope/cscope.out" > "${toplevel}/.vimrc"

echo 'Done!'
