# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publisher < ApplicationRecord
  has_many :books
  has_many :stocks, through: :books

  validates :name, presence: true

  def shops
    shop_ids = stocks.pluck(:shop_id).uniq
    Shop.where(id: shop_ids).sales
  end
end
