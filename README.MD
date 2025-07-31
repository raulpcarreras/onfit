# ONFIT Monorepo

Este es el monorepo para el proyecto ONFIT, que incluye la aplicación móvil, el backend y los paquetes compartidos.

## Requisitos Previos

Asegúrate de tener instalado lo siguiente antes de empezar:

*   [Node.js](https://nodejs.org/) (versión 18 o superior)
*   [pnpm](https://pnpm.io/installation)
*   [Expo CLI](https://docs.expo.dev/get-started/installation/)
*   [Supabase CLI](https://supabase.com/docs/guides/cli)

## Instalación

1.  Clona el repositorio:
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    cd onfit
    ```

2.  Instala las dependencias usando pnpm:
    ```bash
    pnpm install
    ```

3.  Configura las variables de entorno. Copia el archivo `.env.example` (si existe) a `.env` en `apps/app` y rellena las variables necesarias, como las claves de Supabase.

## Ejecución del Proyecto

Desde el directorio raíz del monorepo, puedes ejecutar los siguientes comandos:

*   **Iniciar la aplicación Expo (móvil y web):**
    ```bash
    pnpm --filter app start
    ```

*   **Iniciar la aplicación en Android:**
    ```bash
    pnpm --filter app android
    ```

*   **Iniciar la aplicación en iOS:**
    ```bash
    pnpm --filter app ios
    ```

*   **Iniciar la aplicación en la web:**
    ```bash
    pnpm --filter app web
    ```

## Estructura del Proyecto

El monorepo está organizado de la siguiente manera:

*   `apps/`: Contiene las aplicaciones principales.
    *   `app/`: La aplicación móvil y web de Expo.
    *   `expo-test-app/`: Una aplicación de prueba de Expo.
    *   `wordpress/`: Integración con WordPress.
*   `packages/`: Contiene paquetes compartidos.
    *   `ui/`: Biblioteca de componentes de interfaz de usuario y tipos compartidos.
*   `infra/`: Contiene la configuración de la infraestructura.
*   `supabase/`: Contiene las migraciones y la configuración de Supabase.