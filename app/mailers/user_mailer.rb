class UserMailer < ActionMailer::Base
	default from: "mookman74@gmail.com"

	def welcome_email(user)
		@user = user
		@url = '#'
		@name = @user.name
		mail(to: @user.email, subject: "Welcome to MERL")
	end
end
