Feature: US13 Envío de solicitud de tratamiento
  Como doctor,
  quiero enviar una solicitud de tratamiento,
  para que el paciente inicie o cambie su plan.

  Scenario: Envío exitoso con campos requeridos
    Given el <doctor> está autenticado y existe el paciente <usuario>
    When envía el tratamiento <nombre> con fecha de inicio <fecha_inicio>
    Then el sistema crea la <solicitud> y notifica al paciente

  Examples:
    | doctor | usuario  | nombre            | fecha_inicio | solicitud |
    | Ana    | user123  | Quimioterapia A   | 2025-11-05   | Creada    |

  Scenario: Rechazo por campos requeridos vacíos
    Given el <doctor> está autenticado y existe el paciente <usuario>
    When envía el tratamiento con <campo_vacío>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | usuario | campo_vacío | mensaje_error       |
    | Ana    | user123 | nombre      | Campos requeridos   |

  Scenario: Rechazo por falta de autorización
    Given el <doctor> no tiene permiso para tratar al paciente <usuario>
    When envía un tratamiento
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | usuario  | mensaje_error |
    | Luis   | userXYZ  | No autorizado |
