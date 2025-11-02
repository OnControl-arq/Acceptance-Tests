Feature: US25 Agregar paciente por username
  Como doctor,
  quiero agregar un paciente por su username,
  para gestionarlo en la plataforma.

  Scenario: Invitar usuario existente
    Given el <doctor> está autenticado
    When busca el username <usuario> y envía invitación
    Then se crea la <invitacion> y el paciente es notificado

  Examples:
    | doctor | usuario    | invitacion |
    | Ana    | patient123 | Creada     |

  Scenario: Usuario no encontrado
    Given el <doctor> está autenticado
    When busca el username <usuario>
    Then el sistema muestra <mensaje_error>

  Examples:
    | doctor | usuario     | mensaje_error     |
    | Luis   | unknownUser | Usuario no existe |

  Scenario: Invitación ya pendiente
    Given existe una invitación pendiente para <usuario>
    When el doctor envía otra invitación
    Then el sistema muestra <mensaje_error>

  Examples:
    | usuario   | mensaje_error           |
    | patient123| Invitación existente    |
