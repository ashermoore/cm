@trackYourResults @WorldView
Feature: 'Feature is testing the world view module'

  Background:
	Given I load the campaign monitor website
	Then I click on the "Features" link in the header
	And then I click on the "Track Your Results" link in the sub header

  Scenario:'Testing the layout of the world view module'
	When I look at Worldview module
	Then I should see the header and it includes the text "Introducing Worldview"
	When I look at the watch demo section
	Then I should see a bubble with the "images/features/worldview_bubble.png" image visible
	And the "Watch a Demo" hyperlink
	When I look at the blurb section
	Then I should see the information text
	And the "who is opening it" hyperlink
	When I look at the quotes section
	Then I should see the quote text
	And an avatar image
	And the users twitter handle

  Scenario:'Testing all the hyperlinks and buttons on the module go to the intended locations'
	When I look at Worldview module
	And then I click the "Watch a Demo" button
	Then I should be taken to the demo page "worldview/demo" page
	When I look click the "who is opening it" hyperlink
	Then I should be taken to "www.campaignmonitor.com/features/subscribers/"
	When I click on all the twitter quote author links I should be taken to their twitter page

