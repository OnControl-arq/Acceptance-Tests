Feature: US23 Consultar al doctor por chat
  Como paciente,
  quiero realizar consultas generales al doctor a través del chat
  para resolver dudas sobre mi tratamiento o estado de salud.

  Scenario: Enviar mensaje al doctor de forma exitosa
    Given el <paciente> tiene una <conversación> activa con su <doctor>
      And la sesión de chat está <estado sesión> "Vigente"
    When el <paciente> escribe un <mensaje> y presiona "Enviar"
    Then el sistema muestra el <mensaje> en la conversación del paciente
      And entrega el <mensaje> en la bandeja de chat del <doctor>
      And muestra un <mensaje de confirmación>

    Examples:
      | paciente | doctor        | conversación | estado sesión | mensaje                               | mensaje de confirmación               |
      | Ana      | Dr. Ramírez   | Conv-001     | Vigente       | Doctor, tengo dudas sobre mi dosis.   | Tu mensaje fue enviado correctamente. |
      | Luis     | Dra. Herrera  | Conv-045     | Vigente       | ¿Puedo tomar este medicamento a la par? | Mensaje enviado al doctor.            |

  Scenario: Ver respuesta del doctor en tiempo casi real
    Given el <paciente> tiene abierta la <conversación> con el <doctor>
      And el <doctor> responde con un <mensaje respuesta>
    When el sistema recibe el <mensaje respuesta> del <doctor>
    Then la app del paciente muestra el <mensaje respuesta> en el chat
      And marca la <conversación> como "Actualizada"

    Examples:
      | paciente | doctor      | conversación | mensaje respuesta                                  | conversación (estado) |
      | Ana      | Dr. López   | Conv-010     | Ana, mantén la dosis actual y avísame si empeora.  | Actualizada           |
      | Luis     | Dra. Vega   | Conv-099     | Puedes adelantar la cita si los síntomas aumentan. | Actualizada           |
