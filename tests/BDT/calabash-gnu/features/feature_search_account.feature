Feature: Search fast account

Scenario: As a user I want to search an account by name
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
   And I press view with id "menu_search"
   And I enter text "Asse" into field with id "search_src_text"
   Then I should not see "Equity"
