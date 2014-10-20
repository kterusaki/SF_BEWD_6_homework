class Artist < ActiveRecord::Base
	has_many :songs, dependent: :destroy
	belongs_to :label
	validates :name, :age, presence: true
end
