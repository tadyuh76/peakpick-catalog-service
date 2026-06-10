# PeakPick Catalog Service

Owns product browsing data for the PeakPick demo.

Owned database tables:

- `products`

Run locally:

```bash
pip install -r requirements.txt
uvicorn services.catalog_service.main:app --reload --port 8001
```
