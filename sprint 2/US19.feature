Feature: US19 Revisión de síntomas reportados
  Como doctor,
  quiero revisar los síntomas reportados,
  para evaluar la evolución del tratamiento.

  Scenario: Lista ordenada por severidad y fecha
    Given hay síntomas registrados para el paciente <usuario>
    When el doctor abre la lista de síntomas
    Then la lista se muestra ordenada por <criterio>

  Examples:
    | usuario | criterio                         |
    | user123 | severidad DESC y fecha DESC      |

  Scenario: Sin registros de síntomas
    Given el paciente <usuario> no tiene síntomas registrados
    When el doctor abre la lista de síntomas
    Then el sistema muestra <estado_vacío>

  Examples:
    | usuario | estado_vacío  |
    | user999 | Sin registros |
