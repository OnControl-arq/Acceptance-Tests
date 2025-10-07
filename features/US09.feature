Feature: US09 Solicitud de cita médica
  Como paciente,
  quiero enviar una solicitud de cita
  para recibir atención médica según mi disponibilidad.

  Scenario: Solicitud de cita exitosa
    Given el <paciente> tiene una cuenta activa
    And selecciona <especialidad> y <fecha> disponibles
    When confirma la solicitud
    Then el sistema registra la <cita> y muestra la <confirmación>

  Examples:
    | paciente | especialidad | fecha       | cita   | confirmación            |
    | Ana      | Psicología   | 2025-10-10  | Creada | Cita registrada con éxito |
    | Luis     | Medicina     | 2025-10-11  | Creada | Cita registrada con éxito |

  Scenario: Solicitud fallida por falta de datos
    Given el <paciente> no selecciona una <fecha>
    When intenta registrar la cita
    Then el sistema muestra un <mensaje de error>

  Examples:
    | paciente | fecha | mensaje de error          |
    | Ana      | —     | La fecha es obligatoria   |
