class Song < ActiveRecord::Base
  belongs_to :artist
  validates :track, :time, :genre, presence: true
end
