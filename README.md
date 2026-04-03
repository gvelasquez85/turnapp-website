# TurnFlow Landing Page

Landing page estática enfocada en conversión para TurnFlow, una solución cloud para gestión de turnos y fidelización de clientes.

## Ejecutar localmente

Puedes abrir `index.html` directamente o usar servidor local:

```bash
python3 -m http.server 4173
```

Luego visita `http://localhost:4173`.

## Conectar Git + Vercel para deploy automático a producción

> Recomendado para que cada push actualizado publique el entorno productivo.

1. Sube este repositorio a GitHub/GitLab/Bitbucket.
2. En Vercel, entra a **Add New Project**.
3. Importa el repositorio.
4. Framework preset: **Other** (sitio estático).
5. Build command: vacío.
6. Output directory: vacío.
7. Production Branch: `main`.
8. Haz clic en **Deploy**.
9. En **Settings → Domains**, conecta tu dominio productivo.

Desde ese momento, cada push a `main` hace deploy automático de producción.

## Publicación en un solo comando (recomendado)

Desde tu Codespace o terminal con acceso a GitHub:

```bash
./scripts/publish.sh
```

Opcional: si exportas `GITHUB_TOKEN`, el script también dispara el workflow manual de deploy automáticamente.

```bash
export GITHUB_TOKEN=tu_token
./scripts/publish.sh
```

## Deploy manual con Vercel CLI (opcional)

```bash
npm i -g vercel
vercel login
vercel
vercel --prod
```


## Verificación definitiva cuando salga 404

Si aparece `404: NOT_FOUND` en la URL de Vercel, normalmente significa que **no existe un deploy de producción activo** para ese dominio (no es un problema del HTML en sí).

Haz esta verificación en orden:

1. En GitHub, revisa **Actions → Vercel Production Deploy** del último push a `main`.
   - Si falla, corrige el error mostrado ahí primero.
2. Confirma estos secrets en GitHub (**Settings → Secrets and variables → Actions**):
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID`
3. En Vercel, confirma que el proyecto conectado sea exactamente `gvelasquez85/turnapp-website`.
4. En Vercel, confirma `Production Branch = main`.
5. Lanza un redeploy manual desde GitHub (ejecuta el workflow con **Run workflow**) o desde Vercel (**Deployments → Redeploy**).

Este repositorio ya incluye un workflow que falla explícitamente cuando falta un secret y despliega con `vercel build` + `vercel deploy --prebuilt --prod`.
