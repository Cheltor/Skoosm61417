class Comment < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :post
  has_many :hides
  has_many :users, :through => :hides
end
