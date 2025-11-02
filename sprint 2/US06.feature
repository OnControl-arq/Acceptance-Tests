Feature: US06 Cambio y verificación de teléfono
  Como doctor,
  quiero cambiar y verificar mi número de teléfono,
  para recibir notificaciones correctamente.

  Scenario: Actualización exitosa del teléfono
    Given el <doctor> está autenticado
    And tiene actualmente el teléfono <telefono_actual>
    When actualiza el teléfono a <telefono_nuevo>
    Then el sistema guarda <resultado>
    And envía un <codigo_verificacion> al <telefono_nuevo>

  Examples:
    | doctor | telefono_actual   | telefono_nuevo   | resultado | codigo_verificacion |
    | Ana    | +51 999 999 999   | +51 988 777 666  | Exitoso   | Enviado             |
    | Luis   | +51 900 123 456   | +51 955 111 222  | Exitoso   | Enviado             |

  Scenario: Rechazo por formato inválido
    Given el <doctor> está autenticado
    When actualiza el teléfono a <telefono_nuevo>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | telefono_nuevo | mensaje_error     |
    | Ana    | 123            | Teléfono inválido |
    | Luis   | +51 abc        | Teléfono inválido |

  Scenario: Rechazo por mismo número ya verificado
    Given el <doctor> tiene un teléfono verificado <telefono_actual>
    When actualiza el teléfono a <telefono_nuevo>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | telefono_actual | telefono_nuevo   | mensaje_error |
    | Ana    | +51 999 999 999 | +51 999 999 999 | Mismo valor   |
