class Book < ApplicationRecord
  belongs_to :publisher

  has_many :stocks
  has_many :shops, through: :stocks
end
