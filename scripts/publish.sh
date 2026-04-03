#!/usr/bin/env bash
set -euo pipefail

REPO_SLUG="gvelasquez85/turnapp-website"
WORKFLOW_FILE="vercel-production.yml"
BRANCH="main"

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git no está instalado."
  exit 1
fi

echo "[1/5] Verificando rama actual..."
current_branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$current_branch" != "$BRANCH" ]]; then
  echo "Error: debes estar en '$BRANCH'. Rama actual: '$current_branch'."
  exit 1
fi

echo "[2/5] Verificando estado limpio..."
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Error: hay cambios sin commit."
  git status --short
  exit 1
fi

echo "[3/5] Verificando remoto origin..."
if ! git remote get-url origin >/dev/null 2>&1; then
  echo "Error: no existe remoto 'origin'."
  echo "Configúralo con: git remote add origin https://github.com/${REPO_SLUG}.git"
  exit 1
fi

echo "[4/5] Haciendo push a producción..."
git push -u origin "$BRANCH"

if [[ -n "${GITHUB_TOKEN:-}" ]]; then
  echo "[5/5] Disparando workflow manual en GitHub Actions..."
  curl -fsSL -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "https://api.github.com/repos/${REPO_SLUG}/actions/workflows/${WORKFLOW_FILE}/dispatches" \
    -d "{\"ref\":\"${BRANCH}\"}"
  echo "Workflow despachado correctamente."
else
  echo "[5/5] GITHUB_TOKEN no definido; se omite dispatch manual."
  echo "Puedes lanzar el workflow desde GitHub > Actions > Vercel Production Deploy > Run workflow."
fi

echo "Listo. Verifica deployment en: https://vercel.com/dashboard"
