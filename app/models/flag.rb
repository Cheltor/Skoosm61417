class Flag < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :book
end
