Feature: US07 Cambio de contraseña
  Como doctor,
  quiero cambiar mi contraseña,
  para mantener segura mi cuenta.

  Scenario: Cambio exitoso de contraseña
    Given el <doctor> está autenticado con la <password_actual>
    When envía la <password_actual> y una <password_nueva_valida>
    Then el sistema actualiza la contraseña y renueva la sesión

  Examples:
    | doctor | password_actual | password_nueva_valida |
    | Ana    | OldP@ssw0rd     | NewP@ssw0rd!          |
    | Luis   | OldP@ssw0rd     | N3wS3gura!            |

  Scenario: Rechazo por contraseña débil
    Given el <doctor> está autenticado
    When envía la <password_nueva>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | password_nueva | mensaje_error     |
    | Ana    | 1234           | Contraseña débil  |
    | Luis   | password       | Contraseña débil  |

  Scenario: Rechazo por contraseña actual incorrecta
    Given el <doctor> está autenticado
    When envía la <password_actual> incorrecta y la <password_nueva_valida>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | password_actual | password_nueva_valida | mensaje_error               |
    | Ana    | Wrong           | N3wS3gura!            | Contraseña actual inválida  |
