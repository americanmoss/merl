class UserMailer < ActionMailer::Base
	default from: "lsaffer@tedco.md"

	def welcome_email(user)
		@user = user
		@url = signin_url
		@name = @user.name
		email_with_name = "#{@user.name} <#{@user.email}>"
		mail(to: email_with_name, subject: "Welcome to MERL")
	end
end
