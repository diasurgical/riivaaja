#!/bin/sh
set -e
diff /root/orig_full.asm compare_full.asm > /tmp/asm.diff || true
insertions=$(cat /tmp/asm.diff | grep "^+" | wc -l)
deletions=$(cat /tmp/asm.diff | grep "^-" | wc -l)
total=$(cat /root/orig_full.asm | wc -l)
echo "$(((insertions + deletions) / (total * 2 / 100)))% change, $((insertions)) insertions(+), $((deletions)) deletions(-)"

