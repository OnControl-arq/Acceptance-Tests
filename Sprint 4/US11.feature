Feature: US11 Cancelación de Citas
  Como paciente,
  quiero cancelar una cita previamente confirmada,
  para liberar el horario del médico.

  Scenario: Cancelación exitosa de una cita futura
    Given el <paciente> tiene una cita confirmada para el <fecha_futura>
    When selecciona la opción "Cancelar cita"
    Then el sistema cambia el estado de la cita a "Cancelada"
      And libera el horario en la agenda del doctor
      And emite un evento de notificación al <doctor>

    Examples:
      | paciente | fecha_futura | doctor      |
      | Ana      | 2025-12-01   | Dr. Ramírez |

  Scenario: Intento de cancelar una cita ya realizada
    Given la cita del <fecha_pasada> está en estado "Completada"
    When el <paciente> intenta cancelarla
    Then el sistema muestra el error <mensaje_error>

    Examples:
      | paciente | fecha_pasada | mensaje_error |
      | Ana      | 2025-10-15   | No se puede cancelar una cita pasada |
