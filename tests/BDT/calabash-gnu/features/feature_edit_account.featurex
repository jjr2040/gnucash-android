Feature: Edit Account

Scenario: As a user I want to edit account
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
   And I press "Activo"
   And I press view with id "options_menu"
   And I press "Editar Cuenta"
   And I clear input field with id "input_account_name"
   And I enter text "Cuenta editada" into field with id "input_account_name"
   And I press view with id "input_color_picker"
   And I press "Color 25"
   And I scroll down
   And I clear input field with id "input_account_description"
   And I enter text "Descripción editada" into field with id "input_account_description"
   And I press view with id "checkbox_placeholder_account"
   And I press "Guardar"
   Then I should see "Cuenta editada"
