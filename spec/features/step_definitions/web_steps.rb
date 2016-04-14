Then(/^I should see translation for ([^\"]*)$/) do |key|
  page.should have_content(I18n.t(key))
end

Then(/^I should see image with src (.+)$/) do |img_src|
  page.should have_xpath("//img[@src=#{img_src}]")
end

Then(/^I should see "(.+)"$/) do |text|
  page.should have_content(text)
end

Then(/^\.(.*) should have background (.+)$/) do |div_class, img_src|
  page.find("div.#{div_class}")['style'].should include(img_src)
end

Given(/^I hover over (.+)$/) do |elem|
  page.execute_script("$('#{elem}').trigger('mouseenter')")
end

Then(/^the (.+) element should be visible$/) do |elem|
  find(:css, "#{elem}").should be_visible
end

Then(/^the (.+) element should be invisible$/) do |elem|
  find(:css, "#{elem}").should_not be_visible
end

Given(/^I unhover over (.+)$/) do |elem|
  page.execute_script("$('#{elem}').trigger('mouseleave')")
end