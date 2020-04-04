Feature: Validate name account

Scenario: As a user I want don't create account without name
   Given I press "Siguiente"
   And I press "Siguiente"
   And I press "Siguiente"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Siguiente"
   And I press "Hecho"
   And I wait for progress
   And I press "Cerrar"
   And I press view with id "fab_create_account"
   And I press "Guardar"
   Then I should see "Introduzca un nombre de cuenta para crear una cuenta"
