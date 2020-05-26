require 'calabash-android/calabash_steps'

And /^I select "([^\"]*)" menu$/ do |item|
  if "#{item}"=="Favorites"
    id=1
  end

  if "#{item}"=="Reports"
    id=2
  end

  if "#{item}"=="Export..."
    id=4
  end

  if "#{item}"=="Settings"
    id=5
  end

  if "#{item}"=="Help & Feedback"
    id=6
  end

  elementId = query("android.support.v7.widget.AppCompatCheckedTextView", :text)[id]
  touch("android.support.v7.widget.AppCompatCheckedTextView text:'#{elementId}''")
end

And /^I select manage books$/ do
  elementId = query("android.support.v7.widget.AppCompatTextView", :text)[26]
  touch("android.support.v7.widget.AppCompatTextView text:'#{elementId}''")
end

And /^I select other book$/ do
  elementId = query("android.support.v7.widget.AppCompatTextView", :text)[1]
  touch("android.support.v7.widget.AppCompatTextView text:'#{elementId}''")
end

And /^I press enter$/ do
  perform_action('send_key_enter')
end

And(/^I scroll view "([^"]*)" "([^"]*)"$/) do |view,direction|
   scroll("#{view}",:"#{direction}")
end

And /^I press component "([^"]*)"$/ do |component|
  touch("#{component}")
end

Then /^I see the legend$/ do
  q = query("android.support.v7.widget.AppCompatTextView text:'No chart data available'")
  if q.size == 2
    true
  else
    screenshot_embed
    fail(msg="Error. Not show legend.")
  end
end
