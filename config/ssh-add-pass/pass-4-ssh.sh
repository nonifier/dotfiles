#!/usr/bin/env bash

## Read password-store key from key Comment
## use ssh-keygen -c -f <keyfile> to set the comment

keyfile=$(echo "$1" | sed -n 's/Enter passphrase for \(.*\):\s*$/\1/p')
echo "Extracted key filename $keyfile" >&2
[[ -z "${keyfile}" ]] && exit 1

comment=$(ssh-keygen -l -f "$keyfile" | awk '{print $3}')
echo "Comment from keyfile $keyfile is $comment" >&2
[[ -z "${comment}" ]] && exit 1

passphrase=$(pass show "$comment")
[[ -z "${passphrase}" ]] && exit 1
echo "got passphrase for comment $comment !" >&2

echo "$passphrase"
