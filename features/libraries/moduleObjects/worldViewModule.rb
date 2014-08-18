# Start of world view module and initialize it also passing in the browser for interaction
module WorldViewModule
	def initialize(browser)
		@browser=browser
	end

	# Each definition below is for a single part of the module I am doing this so each part can be tested in isolation or as part of a bigger suite
	def worldViewContainer
		@browser.section(:id, "worldview")
	end

	def worldViewHeader
		worldViewContainer.h2
	end

	def worldViewMap
		worldViewContainer.div(:id, "WVMap")
	end

	def worldViewMapLaunchBtn
		worldViewMap.link(:title, "Watch a demo of Worldview")
	end

	def worldViewMapBubble
		worldViewContainer.div(:id, "WVBubble")
	end

	def worldViewBlurb
		worldViewContainer.p
	end

	def worldViewBlurbLink
		worldViewContainer.p.link
	end

	def worldViewQuotes
		worldViewContainer.div(:id, "quotes")
	end

	def worldViewQuotesSlider
		worldViewQuotes.element(:class, "bjqs-markers")
	end

	def worldViewContainerMobile
		@browser.section(:id, "results")
	end

	def worldViewHeaderMobile
		worldViewContainerMobile.h2
	end

	def worldViewBlurbMobile
		worldViewContainerMobile.p
	end

	def worldViewListMobile
		worldViewContainerMobile.ul
	end
end