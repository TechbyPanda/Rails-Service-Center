class ServiceStationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
	before_action :set_service_station, only: [:edit, :destroy, :show]

	def index
    @service_stations = ServiceStation.all
	end

	def new
		@service_station = ServiceStation.new
	end

	def create
		@service_station = ServiceStation.new(service_station_params)
		@service_station.user_id = current_user.id
		if @service_station.save
			flash[:notice] = "Service center request has been successfully created"
			redirect_to @service_station
		else
			render :new, state: :unprocessable_entity
		end
	end

	def edit
		begin
			authorize @service_station
		rescue => exception
			flash[:alert] = exception.message
			redirect_to root_path
		end
		# @service_station = ServiceStation.find(params[:id])
	end

	def show
		# @service_station = ServiceStation.find(params[:id])
	end

	def update
		@service_station = ServiceStation.find(params[:id])
		if @service_station.update(service_station_params)
				flash[:notice] = "Service station detail updated successfully"
				redirect_to @service_station
		else
				render :edit, status: :unprocessable_entity
		end
	end

	private
	def service_station_params
		params.require(:service_station).permit(:location, :works, :name, :description, :mobile)
	end

	def set_service_station
		begin
			@service_station = ServiceStation.find(params[:id])
		rescue => exception
			flash[:notice] = "Invalid Owner Id"
			redirect_to root_path
		end
	end

	def require_same_user
		if current_user != @service_station.user && !current_user.admin?
				flash[:alert] = "you can only edit or delete your details"
				redirect_to @service_station
		end
	end
end
