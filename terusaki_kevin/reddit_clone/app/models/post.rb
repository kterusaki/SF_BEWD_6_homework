class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, :url, presence: true
	before_create :default_values

	def default_values
		self.vote ||= 0
	end
end
