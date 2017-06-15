class Syllabus < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :year
  has_many :events
end
