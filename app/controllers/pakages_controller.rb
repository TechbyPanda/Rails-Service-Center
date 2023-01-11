class PakagesController < ApplicationController
  before_action :authenticate_user!
	before_action :set_pakage, only: [:edit, :destroy, :show]

	def index
		@service_station = ServiceStation.find(params[:service_station_id])
    @pakages = @service_station.pakages.all
	end

	def new
		@pakage = Pakage.new
	end

	def create
		@pakage = Pakage.new(pakage_params)
		@pakage.service_station_id = params[:service_station_id]
		if @pakage.save
			flash[:notice] = "Service center request has been successfully created"
			redirect_to service_station_pakage_path(params[:service_station_id], @pakage.id)
		else
			render :new, state: :unprocessable_entity
		end
	end

	def edit
		begin
			authorize @pakage
		rescue => exception
			flash[:alert] = exception.message
			redirect_to root_path
		end
		# @pakage = Pakage.find(params[:id])
	end

	def show
		# @pakage = Pakage.find(params[:id])
	end

	def update
		@pakage = Pakage.find(params[:id])
		if @pakage.update(pakage_params)
				flash[:notice] = "Service station detail updated successfully"
				redirect_to @pakage
		else
				render :edit, status: :unprocessable_entity
		end
	end

	private
	def pakage_params
		params.require(:pakage).permit(:name, :price, :description, :pakage_image)
	end

	def set_pakage
		begin
			@pakage = Pakage.find(params[:id])
		rescue => exception
			flash[:notice] = "Invalid Owner Id"
			redirect_to root_path
		end
	end
end
