Responde siempre en español.
1. Principios meta‑regla
•Mantén cada regla ≤ 500 líneas y divide las extensas en archivos compuestos.
•Aporta ejemplos o archivos referenciados para que el agente tenga contexto inmediato.
•Evita directrices vagas: escríbelas como si fueran documentación interna clara y concreta.
•Reutiliza reglas en lugar de repetir el mismo prompt en el chat.  ￼

⸻

2. Gestión de contexto y flujo de trabajo en Cursor
•Utiliza Cmd + K (o Ctrl + K) sobre selecciones pequeñas (1‑50 líneas) para obtener respuestas más precisas.  ￼
•Sólo abre y referencia los archivos imprescindibles (/ Reference Open Editors) para no malgastar la ventana de ≤ 20 000 tokens.  ￼ ￼
•Prefiere Agent mode para cambios complejos y autónomos; reserva Chat solo para conversación.  ￼
•Guarda prompts frecuentes en Notepads y reutilízalos.  ￼
•Añade contexto con @archivo.ext o carpetas pequeñas; evita “volcar” todo el repositorio.  ￼

⸻

3. Estilo y organización de código
•Usa tabulaciones para indentar y prioriza siempre la simplicidad (KISS).
•Evita duplicaciones: busca código existente antes de escribir desde cero.
•Ten presente los entornos dev / test / prod al programar.
•Sigue nomenclatura y formato consistentes (carpetas‑kebab, exports nombrados, variables descriptivas).  ￼
•Impulsa el programming funcional/modular y la seguridad de tipos (TypeScript estricto, interfaces sobre type, etc.).  ￼
•Mantén la base de código limpia y bien organizada; crea archivos pequeños y específicos en lugar de monolitos.  ￼
•Borra el código que no se utilice.

⸻

4. Calidad, pruebas y validación continua
•Escribe pruebas antes que el código, ejecútalas y deja que Cursor itere hasta que todas pasen.  ￼
•Al corregir bugs, no introduzcas nuevas tecnologías sin agotar la solución actual; si cambias el patrón, elimina la versión anterior. (captura)
•Implementa manejadores de errores tempranos y respuestas estructuradas; usa “early returns”.  ￼
•Tras cada cambio que implique servidores locales, reinícialos y mata instancias de pruebas anteriores. (captura)

⸻

5. Seguridad y privacidad
•Trata todo dato del proyecto de forma confidencial; nunca expongas información sensible fuera del IDE.
•Confirma con el usuario cualquier acción irreversible (migraciones, borrados, cambios de esquema).  ￼

⸻

6. Operativa del agente (inspirado en “Operational Doctrine”)
•Reconocimiento antes de actuar: primero inventaría el repo y dependencias, luego planifica.
•Usa envoltorios de comando seguros (timeout 30s <cmd> 2>&1 | cat).
•No generes archivos Markdown salvo petición explícita.
•El agente debe auto‑validarse (tests, linters) y reportar con ✅/⚠️.  ￼

⸻

7. Buenas prácticas adicionales
•DRY + SOLID de forma predeterminada.
•El código debe ser auto‑explicativo; comenta sólo cuando la intención no sea obvia.
•Si un script se va a ejecutar una sola vez, evita guardarlo en el repo; usa comandos efímeros. (captura)