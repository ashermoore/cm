# Call the required libraries
require "rubygems"
require 'selenium/webdriver'
require 'rspec/expectations'
require "watir-webdriver"
require "watir-webdriver/wait"
require "webdriver-user-agent"
require "yaml"
require "uri"
require "rubygems"
require "watir-webdriver"
require "rspec/expectations"

# Remove any old reports/screenshots
@@report_path = "html_reports"
#FileUtils.rm Dir.glob(@@report_path + "/*")

# Setup a browser based of the user input for desktop or mobile version
case ENV['device']
	when "desktop"
		browser = Watir::Browser.new :firefox

	when "mobile"
		driver = Webdriver::UserAgent.driver(:browser => :firefox, :agent => :iphone, :orientation => :portrait)
		browser = Watir::Browser.new driver
end


# Run before every new scenario
Before do |scenario|
	# Set the browser as an instance var so it can be interacted with
	@browser = browser

	# Get the base url from the termnial command if it isnt set use default
	@base_url = ENV['base_url'] || 'https://www.campaignmonitor.com'

	# Print what the test is doing in terminal
	print "\n#{scenario.feature.name}, #{scenario.name}"
end

def screenshot
	# Wait for everything to settle
	sleep 0.5

	# Save as individual files
	png = @browser.driver.screenshot_as(:png)
	#Easiest way to get a unique filename is with Tempfile
	file = Tempfile.new(["screenshot_", ".png"], @@report_path)
	filename = file.path
	file.close(true)

	# Write the screenshot & Embed img element
	File.open(filename, "wb") {|io| io.write(png)}
	embed(File.basename(filename), "image/png")
end

# After every scenario take a screenshot
After do
	screenshot
end

# At end of test set close the browser
at_exit do
	browser.close
end
