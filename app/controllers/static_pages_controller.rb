class StaticPagesController < ApplicationController

	before_action :admin_user, only: :exportimport

	def home
	end

	def about
	end

	def contact
	end

	def export
	end

	def import
	end

	private

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end
