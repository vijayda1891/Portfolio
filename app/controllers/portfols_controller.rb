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

	def edit
		@portfol = Portfol.find(params[:id])
	end

	def update
		respond_to do |format|
			if @portfol.update(params.require(:portfol).permit(:title, :subtitle, :body))
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
end