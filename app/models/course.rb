class Course < ApplicationRecord
  has_many :posts
  belongs_to :subject
  belongs_to :university
  has_many :syllabuses
  has_many :enrolls
  has_many :users, :through => :enrolls

  def name_with_univ
  	"#{name}, #{university.name}"
  end
end
