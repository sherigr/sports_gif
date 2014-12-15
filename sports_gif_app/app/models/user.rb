class User <ActiveRecord::Base
	validates_presence_of :username, presence: true, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :favorites
	has_secure_password
	has_many :gifs, dependent: :destroy

end