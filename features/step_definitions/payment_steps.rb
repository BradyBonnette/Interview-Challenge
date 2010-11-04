Given /^I want to go to the \"Create New Payment\" site$/ do
end

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
