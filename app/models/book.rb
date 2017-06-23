class Book < ApplicationRecord
  belongs_to :user
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than_or_equal_to => 0.01}
end
