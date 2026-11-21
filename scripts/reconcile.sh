#!/bin/bash
FILE="${1:-data/transactions.csv}"

if [ ! -f "$FILE" ]; then
  echo "Error: file not found: $FILE" >&2
  exit 1
fi

echo "Transaction Reconciliation Report"
echo "Reading: $FILE"
echo

echo "Transactions by status:"
tail -n +2 "$FILE" | cut -d',' -f7 | sort | uniq -c | sort -rn
echo

echo "Duplicate transaction IDs:"
tail -n +2 "$FILE" | cut -d',' -f1 | sort | uniq -d
echo

echo "Negative amounts:"
awk -F',' 'NR>1 && $6 < 0' "$FILE"
echo

echo "Missing currency:"
awk -F',' 'NR>1 && $5 == ""' "$FILE"
echo

echo "Amounts over 5000:"
awk -F',' 'NR>1 && $6 > 5000' "$FILE"
echo

echo "Completed totals by currency:"
awk -F',' 'NR>1 && $7 == "completed" {total[$5] += $6} END {for (d in total) print d, total[d]}' "$FILE" | sort -k2 -rn
