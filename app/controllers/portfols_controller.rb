class PortfolsController < ApplicationController

	def index
		@portfolio_items = Portfol.all
	end
end
