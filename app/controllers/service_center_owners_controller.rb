class ServiceCenterOwnersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_service_center_owner, only: [:edit, :destroy, :show]

	def index
	end

	def new
		begin
			@service_center_owner = ServiceCenterOwner.find(current_user.id)
			redirect_to @service_center_owner if @service_center_owner.id?
		rescue => exception
			@service_center_owner = ServiceCenterOwner.new
		end
	end

	def create
		@service_center_owner = ServiceCenterOwner.new(service_center_owner_params)
		@service_center_owner.user_id = current_user.id
		if @service_center_owner.save
			flash[:notice] = "Service center request has been successfully created"
			redirect_to @service_center_owner
		else
			render :new, state: :unprocessable_entity
		end
	end

	def edit
		begin
			auth = authorize @service_center_owner
			puts "Service center request has been successfully #{auth}"
		rescue => e
			flash[:alert] = e.message
			redirect_to root_path
		end
	end

	def show
	end

	def update
		@service_center_owner = ServiceCenterOwner.find(params[:id])
		if @service_center_owner.update(service_center_owner_params)
				flash[:notice] = "Owner detail updated successfully"
				redirect_to @service_center_owner
		else
				render :edit, status: :unprocessable_entity
		end
	end

	private
	def service_center_owner_params
		params.require(:service_center_owner).permit(:name, :address, :city, :state, :mobile, :description, :gender, :Occupation)
	end

	def set_service_center_owner
		begin	
			@service_center_owner = ServiceCenterOwner.find(params[:id])
		rescue => exception
			flash[:notice] = "Invalid Owner Id"
			redirect_to root_path
		end
	end

	def require_same_user
		if current_user != @service_center_owner.user && !current_user.admin?
				flash[:alert] = "you can only edit or delete your details"
				redirect_to @service_center_owner
		end
	end
end