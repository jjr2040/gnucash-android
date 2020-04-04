Feature: Create Transaction

Scenario: As a user I want to create transaction
   Given I press "Next"
   Then take picture
   And I press "Next"
   And I press "Next"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Next"
   And I press "Done"
   And I wait for progress
   And I press view with id "button1"
   And I press "Income"
   And I press "Bonus"
   And I press view with id "fab_create_transaction"
   And I enter text "New Transaction" into field with id "input_transaction_name"
   And I enter text "6" into field with id "input_transaction_amount"
   And I enter text "Transaction Description" into field with id "input_description"
   And I scroll down
   And I press view with id "input_recurrence"
   And I press view with id "repeat_switch"
   And I press "OK"
   And I press view with id "menu_save"
   Then I should see "New Transaction"
