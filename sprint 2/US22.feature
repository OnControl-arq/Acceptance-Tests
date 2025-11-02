Feature: US22 Notificación de fin de tratamiento
  Como doctor,
  quiero recibir una notificación cuando el paciente termine su tratamiento,
  para agendar una cita de cierre.

  Scenario: Recepción de notificación
    Given existe un tratamiento activo del paciente <usuario>
    When el paciente marca el tratamiento como <estado>
    Then el doctor recibe la notificación <tipo_notificacion> como <estado_lectura>

  Examples:
    | usuario | estado     | tipo_notificacion    | estado_lectura |
    | user123 | Completado | TREATMENT_FINISHED   | No leída       |

  Scenario: Marcar notificación como leída y abrir enlace
    Given la notificación <tipo_notificacion> está <estado_lectura>
    When el doctor abre la notificación
    Then queda <nuevo_estado> y se redirige a <destino>

  Examples:
    | tipo_notificacion  | estado_lectura | nuevo_estado | destino                 |
    | TREATMENT_FINISHED | No leída       | Leída        | Agendar cita de cierre |
