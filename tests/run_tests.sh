#!/bin/bash
ACTUAL=$(mktemp)
./scripts/reconcile.sh > "$ACTUAL"

if diff "$ACTUAL" tests/expected_report.txt > /dev/null; then
  echo "PASS: report matches expected output"
  rm "$ACTUAL"
  exit 0
else
  echo "FAIL: report differs from expected output"
  diff "$ACTUAL" tests/expected_report.txt
  rm "$ACTUAL"
  exit 1
fi
