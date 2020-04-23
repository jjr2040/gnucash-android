Feature: Create Account

Scenario: As a user I want to create account
   Given I press "Next"
   #button to open account assets
   When I press list item number 5
   And I press "Next"
   And I press "ADP - Andorran Peseta"
   And I press "Next"
   And I press "Next"
   And I wait
   And I press view with id "text1"
   And I press view with id "text1"
   And I wait
   And I press "Next"
   And I press "Done"
   And I wait for progress
   And I press "Dismiss"
   And I press view with id "fab_create_account"
   And I enter text "New account" into field with id "input_account_name"
   And I press view with id "input_color_picker"
   And I press "Color 25"
   And I scroll down
   And I enter text "Account description" into field with id "input_account_description"
   And I press view with id "checkbox_placeholder_account"
   And I press "Save"
   Then I should see "New account"
