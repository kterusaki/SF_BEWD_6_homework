class Label < ActiveRecord::Base
	has_many :artists, dependent: :nullify
	validates :name, presence: true
end
