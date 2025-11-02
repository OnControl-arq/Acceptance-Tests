Feature: US34 Lista de pacientes del doctor
  Como doctor,
  quiero ver mi lista de pacientes con acciones rápidas,
  para acceder a sus tratamientos y progreso.

  Scenario: Listado paginado con columnas esenciales
    Given el <doctor> tiene múltiples pacientes
    When abre la lista de pacientes
    Then se muestra una tabla con columnas <columnas> y resultados paginados

  Examples:
    | doctor | columnas                      |
    | Ana    | Nombre, Username, Estado      |

  Scenario: Búsqueda por nombre o username
    Given el <doctor> está en la lista de pacientes
    When busca el término <termino>
    Then solo se listan pacientes que contienen <termino>

  Examples:
    | doctor | termino |
    | Ana    | ana     |

  Scenario: Estado vacío
    Given el <doctor> no tiene pacientes
    When abre la lista de pacientes
    Then el sistema muestra <estado_vacío>

  Examples:
    | doctor | estado_vacío  |
    | Luis   | Sin pacientes |
