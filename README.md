# Remit Ops Toolkit

A Bash tool that checks a fictional remittance transactions log (CSV) and prints a reconciliation report.

## What it reports

- Transaction counts by status
- Duplicate transaction IDs
- Negative amounts
- Missing currency
- Amounts over 5000
- Completed totals per currency

## Usage

```bash
./scripts/reconcile.sh                  # uses data/transactions.csv
./scripts/reconcile.sh path/to/file.csv # uses your own file
```

If the file doesn't exist, the script prints an error and exits with code 1.

## Input format

```
id,date,from_country,to_country,currency,amount,status
```

## Example output

See `reports/sample_report.txt`.

## About

Built while learning Linux. All data is fictional.

## Testing

```bash
./tests/run_tests.sh
```

Runs the report on `data/transactions.csv` and compares it with `tests/expected_report.txt`. Prints PASS (exit code 0) or FAIL with a diff (exit code 1).
