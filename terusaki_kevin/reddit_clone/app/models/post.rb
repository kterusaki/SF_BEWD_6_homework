class Post < ActiveRecord::Base
	validates :title, :url, presence: true
	before_create :default_values

	def default_values
		self.vote ||= 0
	end
end
