Feature: Detail Account

Scenario: As a user I want to see detail account
   Given I press "Next"
   Then take picture
   And I press "Next"
   And I press "Next"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Next"
   And I press "Done"
   And I press view with id "button1"
   And I press "Expenses"
   And I should see "SUB-ACCOUNTS"
   And I should see "Adjustment"
   Then I should see "Auto"
