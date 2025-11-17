Feature: US16 Registrar cumplimiento de tratamiento
  Como paciente,
  quiero marcar mi cumplimiento diario del tratamiento
  para llevar un seguimiento adecuado de mi progreso.

  Scenario: Registrar cumplimiento del día actual
    Given el <paciente> tiene un <tratamiento activo> con <dosis> programada para hoy
    When el <paciente> marca la <dosis> de hoy como "Tomada"
    Then el sistema registra el <cumplimiento> para la <fecha> actual
      And actualiza el <porcentaje de avance> del tratamiento
      And muestra un <mensaje de confirmación>

  Examples:
    | paciente | tratamiento activo     | dosis           | fecha       | cumplimiento | porcentaje de avance | mensaje de confirmación                  |
    | Ana      | Quimio ciclo 2         | Pastilla 1      | 2025-11-18  | Registrado   | 60%                  | Dosis registrada correctamente.          |
    | Luis     | Medicamento de soporte | Cápsula noche   | 2025-11-18  | Registrado   | 75%                  | Hemos guardado tu progreso de hoy.      |

  Scenario: Registrar cumplimiento de un día anterior (registro retroactivo)
    Given el <paciente> tiene un <tratamiento activo>
      And olvidó marcar la <dosis> de una <fecha pasada>
    When el <paciente> selecciona la <fecha pasada> en el calendario
      And marca la <dosis> como "Tomada"
    Then el sistema registra el <cumplimiento> retroactivo
      And actualiza el <historial> del tratamiento
      And muestra un <mensaje informativo>

  Examples:
    | paciente | tratamiento activo  | fecha pasada | cumplimiento | historial          | mensaje informativo                                      |
    | Ana      | Quimio ciclo 1      | 2025-11-15   | Registrado   | Actualizado        | Tu dosis del 15/11 ha sido registrada de forma retroactiva. |
    | Luis     | Medicamento diario  | 2025-11-14   | Registrado   | Actualizado        | Se ha actualizado tu historial con la dosis olvidada.    |
