class Post < ApplicationRecord
  acts_as_votable
  belongs_to :course
  belongs_to :user
  has_many :comments
end
