@trackYourResultsMobile @WorldViewMobile
Feature: 'Feature is testing the world view mobile module'

  Background:
	Given I load the campaign monitor website
	Then I click on the main menu drop down menu
	Then I click on the "Features" link in the header


  Scenario:'Testing the layout of the world view module'
	When I look at Worldview mobile module
	Then I should see mobile world view module with the header image of "/images/mobile/results.jpg"
	And the "Learn from the results" header
	And the text blurb
	And a list of items which contain the items "Worldview" "Click Overlay" "Social Reporting" "Subscriber Snapshots"



