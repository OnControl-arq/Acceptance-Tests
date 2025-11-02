Feature: US26 Creación de procedimiento médico
  Como doctor,
  quiero crear un procedimiento,
  para estructurar el plan de tratamiento.

  Scenario: Crear procedimiento con duración y frecuencia
    Given el <doctor> tiene un tratamiento activo
    When crea el procedimiento <nombre> con duración <duracion> y frecuencia <frecuencia>
    Then el procedimiento queda <resultado> y aparece en el plan

  Examples:
    | doctor | nombre            | duracion  | frecuencia     | resultado |
    | Ana    | Examen de sangre  | 10 días   | cada 2 días    | Guardado  |

  Scenario: Parámetros inválidos
    Given el <doctor> tiene un tratamiento activo
    When crea el procedimiento <nombre> con <duracion> y <frecuencia>
    Then el sistema muestra <mensaje_error>

  Examples:
    | nombre | duracion | frecuencia | mensaje_error       |
    | Eco    | -1       | 0          | Parámetros inválidos|

  Scenario: Nombre duplicado
    Given ya existe un procedimiento llamado <nombre>
    When crea otro procedimiento con el mismo <nombre>
    Then el sistema muestra <mensaje_error>

  Examples:
    | nombre            | mensaje_error      |
    | Examen de sangre  | Nombre duplicado   |
