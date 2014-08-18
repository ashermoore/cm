Given(/^I load the campaign monitor website$/) do
	@browser.goto(@base_url)
end

Then(/^I click on the "(.*?)" link in the header$/) do |arg1|
	@browser.element(:id, "primary").wait_until_present
	@browser.link(:text, arg1).click
end

Then(/^then I click on the "(.*?)" link in the sub header$/) do |arg1|
	@browser.element(:id, "secondary").wait_until_present
	@browser.link(:text, arg1).click
end

When(/^I look at Worldview module$/) do
	$user = TrackYourResultsPage.new(@browser)
	$user.worldViewContainer.wait_until_present
end

Then(/^I should see the header and it includes the text "(.*?)"$/) do |arg1|
	$user.worldViewHeader.present?.should == true
	$user.worldViewHeader.text.should == arg1
end

When(/^I look at the watch demo section$/) do
	$user.worldViewMap.wait_until_present
end

Then(/^I should see a bubble with the "(.*?)" image visible$/) do |arg1|
	@browser.div(:id, "WVBubble").style('background-image').include?(arg1).should == true
end

Then(/^the "(.*?)" hyperlink$/) do |arg1|
	case arg1
		when "Watch a Demo"
			$user.worldViewMapLaunchBtn.text.should == arg1

		when "who is opening it"
			$user.worldViewBlurbLink.text.should == arg1
	end
end

When(/^I look at the blurb section$/) do
	$user.worldViewBlurb.wait_until_present
end

Then(/^I should see the information text$/) do
	$user.worldViewBlurb.text != ""
end

When(/^I look at the quotes section$/) do
	$user.worldViewQuotes.wait_until_present
end

Then(/^I should see the quote text$/) do
	$user.worldViewContainer.div(:id, "quotes").text != ""
end

Then(/^an avatar image$/) do
	$user.worldViewQuotesSlider.link(:index, 0).click
	$user.worldViewContainer.div(:id, "quotes").span(:class, "meta").link.img.present?.should == true
end

Then(/^the users twitter handle$/) do
	$user.worldViewQuotesSlider.link(:index, 0).click
	$user.worldViewContainer.div(:id, "quotes").span(:class, "meta").link.text != ""
end

When(/^then I click the "(.*?)" button$/) do |arg1|
	$user.worldViewMapLaunchBtn.wait_until_present
	$user.worldViewMapLaunchBtn.text.should == arg1
	$user.worldViewMapLaunchBtn.click
end

Then(/^I should be taken to the demo page "(.*?)" page$/) do |arg1|
	@browser.url.include?(arg1).should == true
	@browser.back
end

When(/^I look click the "(.*?)" hyperlink$/) do |arg1|
	$user.worldViewBlurbLink.wait_until_present
	$user.worldViewBlurbLink.text.should == arg1
	$user.worldViewBlurbLink.click
end

Then(/^I should be taken to "(.*?)"$/) do |arg1|
	@browser.url.include?(arg1).should == true
	@browser.back
end

When(/^I click on all the twitter quote author links I should be taken to their twitter page$/) do
	$user.worldViewQuotes.ul.lis.each do |test|
		test.span(:class, "meta").link.text.include?(test.span(:class, "meta").link.attribute_value("href"))
	end
end