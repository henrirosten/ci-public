#!/bin/sh

# SPDX-FileCopyrightText: 2023 Technology Innovation Institute (TII)
# SPDX-License-Identifier: Apache-2.0

COMMIT_HASH=055bf464f1a3344870a40f337caa492a69f69dbb

git clone https://github.com/tiiuae/sbomnix
cd sbomnix || exit
git checkout "$COMMIT_HASH"

env NIX_PROFILE=/nix/var/nix/profiles/default nix-env -f default.nix --install
