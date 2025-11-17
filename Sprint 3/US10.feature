Feature: US10 Aceptar una cita
  Como paciente,
  quiero aceptar una cita médica
  para confirmar mi disponibilidad y asistir al encuentro con el doctor.

  Scenario: Aceptar una cita vigente
    Given el <paciente> tiene una <cita> pendiente con el <doctor>
      And la <cita> tiene una <fecha> y <hora> futuras y un <estado> "Pendiente"
    When el <paciente> presiona el botón "Aceptar cita"
    Then el sistema actualiza el <estado> de la <cita> a "Confirmada"
      And muestra un <mensaje de confirmación>
      And la <cita> aparece en el <calendario> del paciente como "Confirmada"

  Examples:
    | paciente | doctor        | fecha       | hora   | estado    | mensaje de confirmación                | calendario |
    | Ana      | Dr. Ramírez   | 2025-11-20  | 09:00  | Pendiente | Cita confirmada correctamente          | Actualizado |
    | Luis     | Dra. Herrera  | 2025-11-22  | 15:30  | Pendiente | Tu cita ha sido confirmada con éxito   | Actualizado |

  Scenario: Intentar aceptar una cita expirada
    Given el <paciente> tiene una <cita> con <fecha> y <hora> ya pasadas
      And el <estado> de la <cita> es "Expirada"
    When el <paciente> intenta presionar el botón "Aceptar cita"
    Then el sistema muestra un <mensaje de error>
      And no cambia el <estado> de la <cita>

  Examples:
    | paciente | doctor      | fecha       | hora   | estado   | mensaje de error                                  |
    | Ana      | Dr. López   | 2025-11-10  | 08:00  | Expirada | No es posible aceptar una cita cuya fecha pasó.  |
    | Luis     | Dra. Vega   | 2025-11-12  | 16:00  | Expirada | La cita ya venció y no puede ser confirmada.     |
