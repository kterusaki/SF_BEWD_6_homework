class Post < ActiveRecord::Base
	validates :title, :url presence: true
end
