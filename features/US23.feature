Feature: US23 Consultar al doctor
  Como paciente,
  quiero enviar mensajes a mi doctor
  para recibir orientación sobre mi estado de salud.

  Scenario: Consulta exitosa al doctor
    Given el <paciente> tiene una sesión activa
    And selecciona un <doctor disponible>
    When envía un <mensaje> desde la aplicación
    Then el sistema registra la <conversación> y muestra la <confirmación>

  Examples:
    | paciente | doctor          | mensaje                       | conversación | confirmación            |
    | Ana      | Dr. Ruiz Pérez  | “Tengo síntomas de ansiedad”  | Creada       | Mensaje enviado con éxito |
    | Luis     | Dra. Ramos Soto | “Duda sobre mi cita médica”   | Creada       | Mensaje enviado con éxito |

  Scenario: Consulta fallida por sesión expirada
    Given el <paciente> intenta enviar un mensaje sin sesión activa
    When presiona <Enviar>
    Then el sistema muestra el <mensaje de error>

  Examples:
    | paciente | mensaje de error            |
    | Ana      | Sesión expirada, inicie sesión nuevamente |
    | Luis     | Token inválido, vuelva a autenticarse     |
