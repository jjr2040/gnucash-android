Feature: Validate amount of transaction

Scenario: As a user I want don't create a transaction without amount
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
   And I press "Capital"
   And I press "Balances de apertura"
   And I press view with id "fab_create_transaction"
   And I enter text "Transacción" into field with id "input_transaction_name"
   And I press "Guardar"
   Then I should see "Introduzca un importe para guardar la transacción"
