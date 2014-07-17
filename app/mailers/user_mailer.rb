class UserMailer < ActionMailer::Base
	default from: "mookman74@gmail.com"

	def welcome_email(user)
		@user = user
		@url = signin_path
		@name = @user.name
		email_with_name = "#{@user.name} <#{@user.email}>"
		mail(to: email_with_name, subject: "Welcome to MERL")
	end
end
