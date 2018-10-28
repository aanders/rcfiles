#!/bin/bash
#
# Setup a custom global git configuration

GIT=git

${GIT} config --global alias.st     "status"
${GIT} config --global alias.ck     "checkout"
${GIT} config --global alias.absorb "commit --amend --no-edit"
${GIT} config --global alias.sub    "submodule"
${GIT} config --global alias.sst    "submodule status"
${GIT} config --global alias.sup    "submodule update"
${GIT} config --global alias.last   "show --stat HEAD"
${GIT} config --global alias.t  "log --graph --decorate --oneline --branches"
