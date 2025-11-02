Feature: US05 Recuperación de cuenta
  Como doctor nuevo o existente,
  quiero recuperar el acceso a mi cuenta,
  para no perder mi información registrada.

  Scenario: Recuperación exitosa por correo
    Given el <usuario> está registrado con el correo <correo_valido>
    When solicita la recuperación mediante correo
    Then el sistema envía un <enlace_recuperacion> a <correo_valido>
    And se registra el evento de auditoría <evento_auditoria>

  Examples:
    | usuario | correo_valido      | enlace_recuperacion | evento_auditoria              |
    | Ana     | ana@mail.com       | Enviado             | PASSWORD_RESET_REQUESTED      |
    | Luis    | luis@mail.com      | Enviado             | PASSWORD_RESET_REQUESTED      |

  Scenario: Recuperación por SMS
    Given el <usuario> está registrado con el teléfono <telefono_valido>
    When solicita la recuperación mediante SMS
    Then el sistema envía un <codigo_sms> a <telefono_valido>

  Examples:
    | usuario | telefono_valido | codigo_sms |
    | Ana     | +51 999 999 999 | Enviado    |

  Scenario: Token inválido o expirado
    Given el <usuario> abre un enlace de recuperación con <token>
    When intenta registrar una <nueva_contraseña_valida>
    Then el sistema muestra el <mensaje_error>

  Examples:
    | usuario | token          | nueva_contraseña_valida | mensaje_error   |
    | Ana     | expired-token  | N3wS3gura!              | Token expirado  |
