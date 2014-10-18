class Artist < ActiveRecord::Base
	has_many :songs, dependent: :destroy
	validates :name, :age, presence: true
end
