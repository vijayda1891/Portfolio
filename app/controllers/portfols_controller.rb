class PortfolsController < ApplicationController

	def index
		@portfolio_items = Portfol.all
	end

	def new
		@portfol = Portfol.new
	end

	def create
		@portfol = Portfol.new(params.require(:portfol).permit(:title, :subtitle, :body))
		respond_to do |format|
			if @portfol.save
				format.html { redirect_to portfols_path, notice: "Portfolio created." }
			else
				format.html { redirect_to :new }
			end
		end
	end
end
