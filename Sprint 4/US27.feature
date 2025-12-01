Feature: US27 Visualizar Resumen de Tratamiento
  Como paciente,
  quiero ver un resumen completo de mi plan,
  para entender todas las indicaciones antes de aceptarlo.

  Scenario: Visualización de detalles completos
    Given el <doctor> ha enviado una propuesta de tratamiento
    When el <paciente> accede a "Ver Resumen"
    Then el sistema muestra:
      | Medicamentos   | <lista_meds> |
      | Procedimientos | <lista_proc> |
      | Duración       | <duracion>   |

    Examples:
      | paciente | lista_meds          | lista_proc      | duracion |
      | Ana      | Paracetamol, Quimio | Análisis Sangre | 3 meses  |
