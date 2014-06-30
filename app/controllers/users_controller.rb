class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to MERL"
			redirect_to @user
		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, 
						:biotechnology, :software, :networking_wirless, :physics_engineering, :chemistry, :medical_devices,
						:availability, :mentoring, :deffered_payment, :raised_money, :successful_exit, :startup_experience)
	end
end
