# == Schema Information
#
# Table name: shops
#
#  id               :integer          not null, primary key
#  name             :string
#  books_sold_count :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Shop < ApplicationRecord
  has_many :stocks
  has_many :books, through: :stocks

  validates :name, presence: true
end
