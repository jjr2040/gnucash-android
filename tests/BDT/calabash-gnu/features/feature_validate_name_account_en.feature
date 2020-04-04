Feature: Validate name account

Scenario: As a user I want don't create account without name
   Given I press "Next"
   And I press "Next"
   And I press "Next"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Next"
   And I press "Done"
   And I wait for progress
   And I press view with id "button1"
   And I press view with id "fab_create_account"
   And I press view with id "menu_save"
   Then I should see "Enter an account name to create an account"