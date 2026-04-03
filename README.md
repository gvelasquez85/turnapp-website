# TurnFlow Landing Page

Landing page estática enfocada en conversión para TurnFlow, una solución cloud para gestión de turnos y fidelización de clientes.

## Ejecutar localmente

Como es un sitio estático, puedes abrir `index.html` directamente o usar un servidor simple:

```bash
python3 -m http.server 4173
```

Luego abre `http://localhost:4173`.

## Despliegue en Vercel

1. Instala Vercel CLI (si no lo tienes):
   ```bash
   npm i -g vercel
   ```
2. Inicia sesión:
   ```bash
   vercel login
   ```
3. En el directorio del proyecto, ejecuta:
   ```bash
   vercel
   ```
4. Para promover a producción:
   ```bash
   vercel --prod
   ```

> También puedes conectar el repo desde el dashboard de Vercel para deploy automático por push.
