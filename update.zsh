#!/usr/bin/env zsh

#adding the submodule broke some stuff oops. This should fix it though, run after pulling, in the root of the repo

git submodule deinit --all -f
rm -rf .git/modules
git submodule update --init --recursive
