Feature: Validate name account

Scenario: As a user I want don't create account without name
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
   And I press view with id "fab_create_account"
   And I press "Save"
   And take picture
   Then I should see "Enter an account name to create an account"
