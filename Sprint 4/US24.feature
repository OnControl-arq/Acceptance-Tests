Feature: US24 Envío de Archivos Adjuntos
  Como usuario (paciente o doctor),
  quiero enviar archivos por el chat,
  para compartir resultados médicos o recetas.

  Scenario: Envío exitoso de imagen válida
    Given el <usuario> está en un chat activo
    When adjunta un archivo <archivo> de tipo "Imagen" (JPG/PNG)
    Then el sistema sube el archivo al Storage
      And muestra una vista previa en la conversación
      And el receptor puede visualizarlo

    Examples:
      | usuario | archivo       |
      | Ana     | radiografia.jpg |
      | Dr. Luis| receta.png      |

  Scenario: Bloqueo de formato no permitido
    Given el <usuario> intenta subir un archivo
    When selecciona el archivo <archivo_invalido>
    Then el sistema rechaza la subida con el mensaje <mensaje_error>

    Examples:
      | usuario | archivo_invalido | mensaje_error |
      | Ana     | virus.exe        | Formato de archivo no permitido |
