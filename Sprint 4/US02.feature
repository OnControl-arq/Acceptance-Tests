Feature: US02 Gestión de Pagos y Suscripción
  Como usuario general,
  quiero configurar mis métodos de pago y suscripción,
  para acceder a servicios premium de OnControl.

  Scenario: Suscripción exitosa a un plan Premium
    Given el <usuario> tiene una cuenta "Free" activa
    When selecciona el plan "Premium" e ingresa una <tarjeta> válida
    Then el sistema procesa el pago con la pasarela
      And actualiza el plan del usuario a "Premium"
      And envía un <correo_confirmación>

    Examples:
      | usuario | tarjeta             | correo_confirmación |
      | Ana     | 4111-xxxx-xxxx-1111 | Suscripción Premium activada |
      | Dr. Luis| 4242-xxxx-xxxx-4242 | Plan Profesional activado    |

  Scenario: Fallo en el pago por tarjeta inválida
    Given el <usuario> intenta cambiar de plan
    When ingresa una <tarjeta> rechazada o sin fondos
    Then el sistema muestra el mensaje <mensaje_error>
      And no actualiza el plan

    Examples:
      | usuario | tarjeta             | mensaje_error |
      | Ana     | 0000-xxxx-xxxx-0000 | Tarjeta inválida o fondos insuficientes |
