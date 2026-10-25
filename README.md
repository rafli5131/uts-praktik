# Data Systems Architecture — Practical Coursework

An educational repository containing practical exercises for data processing, relational databases, MongoDB document design, SQL analytics, and a small Jupyter notebook workflow.

## What's included

| Path | Purpose |
| --- | --- |
| [`main.ipynb`](main.ipynb) | Python and database exercises |
| [`UTS_Arsitektur_Sistem_Data.md`](UTS_Arsitektur_Sistem_Data.md) | Original practical assignment brief |
| [`datasets/`](datasets/) | Sample CSV/JSON/SQL inputs and example outputs |
| [`query/`](query/) | SQL/query-related materials |
| [`init/`](init/) | Environment initialization assets |
| [`docker-compose.yml`](docker-compose.yml) | Local database services |

## Topics

- Batch ingestion and basic data-cleaning workflows.
- SQL relations, joins, and window functions.
- MongoDB documents and basic queries.
- Data-processing experiments in Jupyter.

## Run locally

```bash
git clone https://github.com/rafli5131/uts-praktik.git
cd uts-praktik
docker compose up -d
```

Use a Python/Jupyter environment with the libraries imported by `main.ipynb`. Review the Compose configuration and notebook connection strings before running cells, and change any sample development passwords. Follow the original assignment document for data file names and expected outputs.

## Limitations

This repository preserves class exercises, sample data, and notebook state, rather than presenting a production analytics pipeline. Notebook outputs, data, and dependency versions may need adjustment on another machine.

For a more complete engineering portfolio, see the [profile repository](https://github.com/rafli5131/rafli5131).
