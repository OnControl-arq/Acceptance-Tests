Feature: US08 Actualización de foto de perfil
  Como doctor,
  quiero actualizar mi foto de perfil,
  para mantener mi información al día.

  Scenario: Carga de imagen válida
    Given el <doctor> está autenticado
    When sube la imagen <archivo> con tamaño <tamaño_kb>
    Then el sistema actualiza el avatar y genera miniatura

  Examples:
    | doctor | archivo     | tamaño_kb |
    | Ana    | avatar.jpg  | 200       |
    | Luis   | perfil.png  | 150       |

  Scenario: Formato no soportado
    Given el <doctor> está autenticado
    When sube la imagen <archivo>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | archivo      | mensaje_error         |
    | Ana    | avatar.tiff  | Formato no soportado  |

  Scenario: Imagen demasiado grande
    Given el <doctor> está autenticado
    When sube la imagen <archivo> con tamaño <tamaño_mb>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | archivo   | tamaño_mb | mensaje_error         |
    | Luis   | big.png   | 8         | Tamaño máximo excedido|
