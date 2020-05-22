Feature: Go to back in configuration

Scenario: As a user I want to go configuration
   Given I press "Next"
   #button to open account assets
   When I press list item number 5
   And I press "Next"
   And I press "ADP - Andorran Peseta"
   And I press "Next"
   And I press "Next"
   And I wait
   And I press view with id "text1"
   And I wait
   And I press view with id "text1"
   And I wait
   And I press "Next"
   And I press "Done"
   And I wait for progress
   And I press "Dismiss"
   And I press image button number 1
   And I wait
   And I scroll view "NavigationMenuView" "down"
   And I wait
   And I select "Settings" menu
   And I wait
   And I should see "General Preferences"
   And I wait
   And I press "Backup & export"
   And I wait
   And I press image button number 1
   And I wait
   Then I should see "General Preferences"
