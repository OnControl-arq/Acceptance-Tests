Feature: US36 Visualización de Procedimientos del Día
  Como paciente,
  quiero ver qué procedimientos me tocan hoy,
  para cumplir con mi agenda médica.

  Scenario: Listar procedimientos del día actual
    Given hoy es <fecha_actual>
    And el paciente tiene procedimientos programados
    When ingresa a la sección "Hoy"
    Then el sistema lista los procedimientos <procedimientos> con hora y estado

    Examples:
      | fecha_actual | procedimientos |
      | 2025-11-30   | Tomografía (10:00 AM), Inyección (04:00 PM) |

  Scenario: Día sin procedimientos
    Given hoy es <fecha_actual>
    And no hay actividades programadas
    When ingresa a la sección "Hoy"
    Then el sistema muestra "No tienes procedimientos pendientes para hoy"

    Examples:
      | fecha_actual |
      | 2025-12-25   |
