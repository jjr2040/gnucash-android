Feature: Edit Account

Scenario: As a user I want to edit account
   Given I press "Next"
   And I press "Next"
   And I press "Next"
   And I wait for progress
   And I press view with id "text1"
   And I wait for progress
   And I press "Next"
   And I press "Done"
   And I wait for progress
   And I press "Dismiss"
   And I press "Assets"
   And I press view with id "options_menu"
   And I press "Edit Account"
   And I clear input field with id "input_account_name"
   And I enter text "Food" into field with id "input_account_name"
   And I press view with id "input_color_picker"
   And I press "Color 25"
   And I scroll down
   And I clear input field with id "input_account_description"
   And I enter text "Food description" into field with id "input_account_description"
   And I press view with id "checkbox_placeholder_account"
   And I press "Save"
   Then I should see "Food"
