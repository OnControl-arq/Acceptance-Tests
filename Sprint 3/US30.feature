Feature: US30 Configurar recordatorios de la aplicación
  Como usuario general,
  quiero personalizar mis notificaciones
  para adaptarlas a mi rutina diaria y no olvidar mis actividades médicas.

  Scenario: Configurar recordatorios con horario válido
    Given el <usuario> accede a la pantalla de configuración de <recordatorios>
    When el <usuario> selecciona los <tipos de recordatorio>
      And define un <horario> para recibir las notificaciones
      And guarda la configuración
    Then el sistema almacena las <preferencias> de recordatorio
      And muestra un <mensaje de confirmación>

  Examples:
    | usuario | recordatorios             | tipos de recordatorio                  | horario  | preferencias                        | mensaje de confirmación                          |
    | Ana     | Citas y medicamentos     | Citas médicas, Toma de medicamentos    | 08:00    | Notificaciones diarias a las 08:00  | Tus recordatorios se guardaron correctamente.    |
    | Luis    | Procedimientos y citas   | Procedimientos, Citas de control       | 19:30    | Avisos cada día a las 19:30         | Configuración de notificaciones actualizada.     |

  Scenario: Intentar guardar recordatorios sin seleccionar horario
    Given el <usuario> accede a la pantalla de configuración de <recordatorios>
      And selecciona uno o más <tipos de recordatorio>
      And no selecciona ningún <horario>
    When el <usuario> presiona el botón "Guardar"
    Then el sistema muestra un <mensaje de error>
      And no almacena las <preferencias> incompletas

  Examples:
    | usuario | tipos de recordatorio             | horario | mensaje de error                                              |
    | Ana     | Citas médicas                     | (vacío) | Debes seleccionar al menos un horario para tus recordatorios. |
    | Luis    | Medicamentos y procedimientos     | (vacío) | No se pudo guardar: falta definir un horario de notificación. |
