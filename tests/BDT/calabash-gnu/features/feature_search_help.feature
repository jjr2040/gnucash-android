Feature: Search in Help

Scenario: As a user I want to search in section Help
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
   And take picture
   And I press image button number 1
   And take picture
   And I scroll view "NavigationMenuView" "down"
   And take picture
   And I select "Help & Feedback" menu
   And take picture
   And I press view with id "uv_action_search"
   And take picture
   And I enter text "How" into field with id "search_src_text"
   And take picture
   Then I should see "How can I recover my data?"
