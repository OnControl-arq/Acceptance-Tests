Feature: US14 Gestionar cambios en el tratamiento
  Como paciente,
  quiero aceptar o rechazar cambios en mi tratamiento
  para mantener control sobre mi plan terapéutico.

  Scenario: Aceptar cambios en tratamiento
    Given el <paciente> recibe una <solicitud de cambio> de tratamiento del <doctor>
      And la solicitud muestra el <tratamiento actual> y el <tratamiento propuesto>
    When el <paciente> presiona el botón "Aceptar cambios"
    Then el sistema actualiza el <tratamiento actual> al <tratamiento propuesto>
      And muestra un <mensaje de confirmación>
      And el <doctor> recibe una <notificación> de aceptación

  Examples:
    | paciente | doctor        | tratamiento actual        | tratamiento propuesto                | mensaje de confirmación                         | notificación                         |
    | Ana      | Dr. Ramírez   | Quimio ciclo 1 cada 21d   | Quimio ciclo 2 cada 21d              | Cambios de tratamiento aceptados correctamente | Paciente Ana aceptó los cambios.     |
    | Luis     | Dra. Herrera  | Medicamento A diario      | Medicamento A diario + Medicamento B | Se ha actualizado tu plan de tratamiento        | Paciente Luis aceptó los cambios.    |

  Scenario: Rechazar cambios en tratamiento
    Given el <paciente> recibe una <solicitud de cambio> de tratamiento del <doctor>
      And la solicitud muestra el <tratamiento actual> y el <tratamiento propuesto>
    When el <paciente> presiona el botón "Rechazar cambios"
    Then el sistema mantiene el <tratamiento actual> sin modificaciones
      And muestra un <mensaje de rechazo>
      And el <doctor> recibe una <notificación> de rechazo

  Examples:
    | paciente | doctor      | tratamiento actual     | tratamiento propuesto            | mensaje de rechazo                               | notificación                           |
    | Ana      | Dr. López   | Medicamento C diario   | Medicamento C cada 2 días        | Has rechazado los cambios en tu tratamiento.     | Paciente Ana rechazó los cambios.     |
    | Luis     | Dra. Vega   | Radio ciclo corto      | Radio ciclo prolongado           | Los cambios propuestos fueron rechazados.        | Paciente Luis rechazó los cambios.    |
