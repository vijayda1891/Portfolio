module DynamicPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Portfol | My Portfolio Website"
	end
end