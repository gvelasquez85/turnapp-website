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

## Deploy manual con Vercel CLI (opcional)

```bash
npm i -g vercel
vercel login
vercel
vercel --prod
```

## Si ves 404 en Vercel

1. Verifica que el proyecto apunta al repositorio correcto y al root del proyecto.
2. Verifica que la rama `main` exista y tenga `index.html` en la raíz.
3. Confirma que el último deploy fue exitoso en **Vercel → Deployments**.
4. Reintenta un deploy manual (`vercel --prod`) o haz un nuevo push.
