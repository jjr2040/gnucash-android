Feature: Bar Chart

Scenario: As a user I want to see bar chart
   Given I press "Next"
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
   And I select "Reports" menu
   And take picture
   And I press view with id "btn_bar_chart"
   And take picture
   And I press component "android.support.v7.widget.ActionMenuPresenter$OverflowMenuButton"
   And take picture
   And I press "Show legend"
   And take picture
   And I wait
   And take picture
   Then I see the legend
