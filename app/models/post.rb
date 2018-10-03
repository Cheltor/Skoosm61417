class Post < ApplicationRecord
  acts_as_votable
  belongs_to :course
  belongs_to :user
  has_many :comments, dependent: :nullify
  has_many :flags
  has_many :users, :through => :flags
  validates_format_of :url, :with => /\A^https?+.{1,}\z/i, :allow_blank => true
end
class Post
  def self.highest_voted
    self.order("cached_votes_score DESC")
  end
end
