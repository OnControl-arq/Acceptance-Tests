Feature: US20 Consultar información de medicamentos
  Como paciente,
  quiero consultar la composición y las reacciones de un medicamento
  para identificar posibles efectos adversos.

  Scenario: Ver detalles de un medicamento asignado
    Given el <paciente> tiene un <medicamento> asignado en su tratamiento
    When el <paciente> abre la ficha del <medicamento>
    Then el sistema muestra la <composición>, la <dosis>, la <frecuencia> y las <advertencias>
      And muestra un <mensaje de información>

  Examples:
    | paciente | medicamento | composición                  | dosis        | frecuencia      | advertencias                             | mensaje de información                        |
    | Ana      | Medicamento A | Sustancia X 50mg, Y 10mg  | 1 tableta    | Cada 8 horas    | No mezclar con alcohol.                  | Revisa estos datos antes de tomar tu medicina. |
    | Luis     | Medicamento B | Sustancia Z 100mg         | 2 cápsulas   | Una vez al día  | Puede causar somnolencia.                | Esta es la información oficial del medicamento.|

  Scenario: Reportar una reacción adversa relacionada al medicamento
    Given el <paciente> está visualizando la ficha del <medicamento>
      And presenta una <reacción adversa>
    When el <paciente> presiona el botón "Reportar reacción"
      And describe la <reacción> en el formulario
    Then el sistema registra el reporte de <reacción adversa>
      And envía una <notificación> al <doctor> con los detalles

  Examples:
    | paciente | doctor      | medicamento   | reacción adversa              | reacción                          | notificación                                 |
    | Ana      | Dr. Ramírez | Medicamento A | Náuseas fuertes y mareos      | Náuseas intensas después de tomar | Reporte de reacción enviado al Dr. Ramírez. |
    | Luis     | Dra. Vega   | Medicamento B | Erupción en la piel y picazón | Aparición de ronchas en brazos    | Reporte de reacción enviado a la Dra. Vega. |
