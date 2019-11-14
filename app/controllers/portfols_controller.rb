class PortfolsController < ApplicationController
	skip_before_action :verify_authenticity_token
	layout "portfol"
	access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update, :sort]}, site_admin: :all

	def index
		@portfolio_items = Portfol.by_position
	end

	def sort
		params[:order].each do |key, value|
			Portfol.find(value[:id]).update(position: value[:position])
		end

		render body: nil
	end

	def new
		@portfol = Portfol.new
		# @portfol.technologies.build
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
		@portfol = Portfol.find(params[:id])
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
		params.require(:portfol).permit(:title,
										:subtitle, 
										:body, 
										:main_image, 
										:thumb_image, 
										technologies_attributes: [:id, :name, :_destroy]
									    )
	end
end
