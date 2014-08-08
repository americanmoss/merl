class User < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	before_save { self.email = email.downcase }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, on: :create
	before_create :create_remember_token

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |user|
				csv << user.attributes.values
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers:true) do |row|
			User.create! row.to_hash
		end
	end

	private

	def create_remember_token
		self.remember_token = User.digest(User.new_remember_token)
	end
end
