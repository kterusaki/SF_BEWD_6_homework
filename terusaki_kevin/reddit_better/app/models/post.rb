class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :link, presence: true
  before_create :default_values

  def default_values
  	self.votes ||= 0
  end

end
