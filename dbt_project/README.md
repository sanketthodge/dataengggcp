# dbt + BigQuery project

## One-time setup (per machine)

```bash
# 1. Authenticate to GCP (opens a browser)
gcloud auth login
gcloud auth application-default login

# 2. Create/activate the venv (already created if you're reading this after initial setup)
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Connection config lives in `~/.dbt/profiles.yml` (outside the repo — it's environment/machine
config, not project code, and dbt's own convention). It points at GCP project `sankettraining-0`,
dataset `dbt_dev`, using your local gcloud OAuth session — no key files involved.

## Daily use

```bash
source .venv/bin/activate
dbt debug   # verify the BigQuery connection
dbt run     # build models
dbt test    # run tests
```

In VS Code, open the repo root — the dbt Power User extension (recommended in
`.vscode/extensions.json`) will pick up this project automatically and gives inline
model previews, lineage, and run/test buttons.

## Git workflow

- `main` is the protected branch.
- Create a feature branch per change: `git checkout -b <type>/<short-description>`
  (e.g. `feat/add-orders-staging-model`, `fix/customer-dedup`).
- Open a PR into `main` when ready; merge after review.
- Never commit `target/`, `dbt_packages/`, `logs/`, or the `.venv/` — see `.gitignore`.
