Then(/^I click on the main menu drop down menu$/) do
	@browser.link(:class, "menu-link").click
end

When(/^I look at Worldview mobile module$/) do
	$user = TrackYourResultsPage.new(@browser)
	$user.worldViewContainerMobile.wait_until_present
end

Then(/^I should see mobile world view module with the header image of "(.*?)"$/) do |arg1|
	$user.worldViewContainerMobile.style('background-image').include?(arg1).should == true
end

Then(/^the "(.*?)" header$/) do |arg1|
	$user.worldViewHeaderMobile.text.should == arg1
end

Then(/^the text blurb$/) do
	$user.worldViewBlurbMobile.text != ""
end

Then(/^a list of items which contain the items "(.*?)" "(.*?)" "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3, arg4|
	$user.worldViewListMobile.li(:index, 0).text.should == arg1
	$user.worldViewListMobile.li(:index, 1).text.should == arg2
	$user.worldViewListMobile.li(:index, 2).text.should == arg3
	$user.worldViewListMobile.li(:index, 3).text.should == arg4
end