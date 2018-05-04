class Shop < ApplicationRecord
  has_many :stocks
  has_many :books, through: :stocks
end
