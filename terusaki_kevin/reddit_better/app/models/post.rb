class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :link, presence: true
  before_create :default_values

  def default_values
  	self.vote ||= 0
  end

end
