#!/bin/sh
set -e
diff /root/spawn-orig_full.asm compare_full.asm > /tmp/asm.diff || true
insertions=$(cat /tmp/asm.diff | grep -v "asm" | grep "^+" | grep -vc ';')
deletions=$(cat /tmp/asm.diff | grep -v "asm" | grep "^-" | grep -vc ';')
total=$(grep -v ^$ /root/orig_full.asm | grep -vc ';')
accuracy="$(((insertions + deletions) / (total * 2 / 100)))% change, $((insertions)) insertions(+), $((deletions)) deletions(-)"
echo "$accuracy" > accuracy.txt
echo "$accuracy"
