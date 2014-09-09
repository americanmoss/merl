class BioValidator < ActiveModel::Validator
	def validate(record)
		if record.bio =~ /^(http(s)?:\/\/)?([\w]+\.)?linkedin\.com/
			unless record.bio =~ /^(http(s)?:\/\/)?([\w]+\.)?linkedin\.com\/(pub|in)/
				record.errors[:base] << "Please remember to use your public LinkedIn profile link so that everyone will be able to view it. 
							This is the linkedin address that starts with linkedin.com/pub or linkedin.com/in.
							To find your public profile link, please navigate here: https://www.linkedin.com/profile/public-profile-settings"	
			end
		end
	end
end