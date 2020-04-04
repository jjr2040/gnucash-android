Feature: Detail Account

Scenario: As a user I want to see detail account
   Given I press "Next"
   And I press "Next"
   And I press "Next"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Next"
   And I press "Done"
   And I press "Dismiss"
   And I press "Expenses"
   And I should see "Sub-accounts"
   And I should see "Auto"
   Then I should see "Books"
