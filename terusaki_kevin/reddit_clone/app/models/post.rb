class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, :url, presence: true
	before_create :default_values

	def default_values
		self.vote ||= 0
	end

	def self.search(search)
		if search
			self.where('title LIKE ?', "%#{search}%")
		else
			self.all
		end
	end
end
