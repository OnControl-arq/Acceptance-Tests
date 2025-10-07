Feature: US10 Aceptar cita médica
  Como profesional de salud,
  quiero aceptar las solicitudes de cita
  para confirmar la atención con el paciente.

  Scenario: Aceptación de cita exitosa
    Given el <doctor> visualiza la lista de <citas pendientes>
    When selecciona una <cita> y confirma la aceptación
    Then el sistema actualiza el estado a <Aceptada> y notifica al <paciente>

  Examples:
    | doctor | citaId | estado    | paciente | notificación            |
    | Dr. Ruiz | 102   | Aceptada  | Ana      | Cita confirmada con éxito |
