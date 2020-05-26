Feature: Edit Account

Scenario: As a user I want to edit account
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
   And take picture
   And I press "Assets"
   And take picture
   And I press view with id "options_menu"
   And take picture
   And I press "Edit Account"
   And take picture
   And I clear input field with id "input_account_name"
   And I enter text "Food" into field with id "input_account_name"
   And I press view with id "input_color_picker"
   And I press "Color 25"
   And I scroll down
   And I clear input field with id "input_account_description"
   And I enter text "Food description" into field with id "input_account_description"
   And I press view with id "checkbox_placeholder_account"
   And take picture
   And I press "Save"
   And take picture
   Then I should see "Food"
