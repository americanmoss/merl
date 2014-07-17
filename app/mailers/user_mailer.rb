class UserMailer < ActionMailer::Base
	default from: "lsaffer@tedco.md",
		bcc: 'lsaffer@tedco.md',
		reply_to: 'lsaffer@tedco.md'

	def welcome_email(user)
		@user = user
		@name = @user.name
		email_with_name = "#{@user.name} <#{@user.email}>"
		mail(to: email_with_name, subject: "Welcome to MERL")
	end
end
