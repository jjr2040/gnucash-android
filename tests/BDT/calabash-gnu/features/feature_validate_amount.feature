Feature: Validate amount of transaction

Scenario: As a user I want don't create a transaction without amount
   Given I press "Next"
   And I press "Next"
   And I press "Next"
   And I wait
   And I press view with id "text1"
   And I wait
   And I press "Next"
   And I press "Done"
   And I wait
   And I press "Dismiss"
   And I press "Equity"
   And I press "Opening Balances"
   And I press view with id "fab_create_transaction"
   And I enter text "Transaction" into field with id "input_transaction_name"
   And I press "Save"
   Then I should see "Enter an amount to save the transaction"
