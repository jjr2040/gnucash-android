Feature: Detail Account

Scenario: As a user I want to see detail account
   Given I press "Siguiente"
   Then take picture
   And I press "Siguiente"
   And I press "Siguiente"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Siguiente"
   And I press "Hecho"
   And I press "Cerrar"
   And I press "Gastos"
   And I should see "Sub-cuentas"
   And I should see "Ajustes"
   Then I should see "Automóvil"
