Feature: Detail Account

Scenario: As a user I want to see detail account
   Given I press "Next"
   And I press "Next"
   And I press "Next"
   And I wait
   And I press view with id "text1"
   And I wait
   And I press "Next"
   And I press "Done"
   And I press "Dismiss"
   And take picture
   And I press "Expenses"
   And take picture
   And I should see "Sub-accounts"
   And I should see "Auto"
   And take picture
   Then I should see "Books"
