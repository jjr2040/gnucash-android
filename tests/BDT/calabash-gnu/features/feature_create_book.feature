Feature: Create book

Scenario: As a user I want to create a book
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
   And I wait
   And take picture
   And I press view with id "book_name"
   And I wait
   And take picture
   And I select manage books
   And take picture
   And I press view with id "menu_create_book"
   And take picture
   Then I should see "GnuCash Accounts successfully imported"
