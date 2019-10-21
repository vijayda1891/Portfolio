class PortfolsController < ApplicationController

	layout "portfol"

	def index
		@portfolio_items = Portfol.all
	end

	def new
		@portfol = Portfol.new
		@portfol.technologies.build
	end

	def create
		@portfol = Portfol.new(portfol_params)
		respond_to do |format|
			if @portfol.save
				format.html { redirect_to portfols_path, notice: "Portfolio created." }
			else
				format.html { redirect_to :new }
			end
		end
	end

	def edit
		@portfol = Portfol.find(params[:id])
	end

	def update
		respond_to do |format|
			if @portfol.update(portfol_params)
				format.html { redirect_to portfols_path, notice: "Portfolio Edited Succesfully." }
			else
				format.html { redirect_to :edit }
			end
		end
	end

	def show
		@portfol = Portfol.find(params[:id])
	end

	def destroy
		@portfol = Portfol.find(params[:id])
		@portfol.destroy
		respond_to do |format|
			format.html { redirect_to portfols_path, notice: "Portfolio Deleted" }
		end
	end


	private

	def portfol_params
		params.require(:portfol).permit(:title, :subtitle, :body, :technologies_attributes[:name])
	end
end
