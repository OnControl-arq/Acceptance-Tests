Feature: US35 Historial de tratamientos
  Como doctor,
  quiero ver el historial de tratamientos del paciente,
  para revisar su evolución.

  Scenario: Mostrar historial cronológico
    Given existe un historial de tratamientos del paciente <usuario>
    When el doctor abre el historial
    Then los ítems se muestran ordenados de <orden> e incluyen <campos>

  Examples:
    | usuario | orden                 | campos               |
    | user123 | más nuevo a más viejo | estado y hitos clave |

  Scenario: Sin historial
    Given el paciente <usuario> no tiene tratamientos pasados
    When el doctor abre el historial
    Then el sistema muestra <estado_vacío>

  Examples:
    | usuario | estado_vacío |
    | user999 | Sin historial|
