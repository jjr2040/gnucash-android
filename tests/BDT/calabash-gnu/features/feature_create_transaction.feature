Feature: Create Transaction

Scenario: As a user I want to create transaction
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
   And I press "Ingresos"
   And I press "Pagos extra"
   And I press view with id "fab_create_transaction"
   And I enter text "Nueva Transacción" into field with id "input_transaction_name"
   And I press view with id "input_transaction_amount"
   And I press view with id "calculator_keyboard"
   And I press view with id "input_transaction_type"
   And I press view with id "layout_double_entry"
   And I press view with id "text1"
   And I enter text "Descripción de la transaccion" into field with id "input_description"
   And I scroll down
   And I press view with id "input_recurrence"
   And I press view with id "repeat_switch"
   And I press "Aceptar"
   And I press "Guardar"
   Then I should see "Nueva Transacción"
