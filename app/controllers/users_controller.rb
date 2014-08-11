class UsersController < ApplicationController

	require "csv"

	before_action :signed_in_user, only: [:edit, :update, :destroy, :import]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: [:destroy, :import]
	
	def new
		@user = User.new
	end

	def show
		@user = User.friendly.find(params[:id])
	end

	def index
		@users = User.all
		respond_to do |format|
			format.html
			format.csv { 
				if current_user.try(:admin?) 
					send_data @users.to_csv 
				else
					redirect_to(users_path)
					flash[:error] = "Only administrators may download data"
				end
			}
			format.xls {
				if current_user.try(:admin?) 
					send_data @users.to_csv(col_sep: "\t")
				else
					redirect_to(users_path)
					flash[:error] = "Only administrators may download data"
				end
			}
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome_email(@user).deliver
			sign_in @user
			flash[:success] = "Welcome to MERL"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		User.friendly.find(params[:id]).destroy
    		flash[:success] = "MERL member deleted."
    		redirect_to users_url
	end

	def update 
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def import
		User.import(params[:file])
		redirect_to root_url flash[:success] = "Users imported"
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :organization, :phone,
						:biotechnology, :software, :networking_wirless, :physics_engineering, :chemistry, :medical_devices,
						:availability, :mentoring, :deffered_payment, :raised_money, :successful_exit, :startup_experience, :private, :slug)
	end

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	def correct_user
		@user = User.friendly.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end
