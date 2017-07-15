class Post < ApplicationRecord
  acts_as_votable
  belongs_to :course
  belongs_to :user
  has_many :comments, dependent: :nullify
  has_many :flags
  has_many :users, :through => :flags
end
