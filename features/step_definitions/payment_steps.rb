Given /^I want to go to the \"Create New Payment\" site$/ do
end

# Match an html object associated with a particular label,
# assuming a particular naming convention.
# e.g. Customer Name = customer_name
Then /^I should see a (.+) for \"(.+)\"$/ do |item,title|
  id = title.split.join("_").downcase
  case item
    when /select(ion)? box/
      page.should have_xpath("//select[@id='#{id}']")
    when /text(\s*)box/
      page.should have_xpath("//input[@type='text' and @id='payment_#{id}']")
    when /button/
      page.should have_xpath("//input[@type='submit' and @value='#{title}']")
  end
end

Then /^I should see an error message$/ do
	page.should have_selector '#notice'
end

