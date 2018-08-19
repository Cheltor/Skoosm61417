class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :books
  belongs_to :university
  has_many :comments
  acts_as_voter
  has_many :enrolls
  has_many :courses, :through => :enrolls
  has_many :flags
  has_many :posts, :through => :flags
  has_many :hides
  has_many :comments, :through => :hides
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[e]+[d]+[u]\z/i

  
  def increase_karma(count=1)
    update_attribute(:karma, karma + count)
  end
  
  def decrease_karma(count=1)
    update_attribute(:karma, karma - count)
  end
end
