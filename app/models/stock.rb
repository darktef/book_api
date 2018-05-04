# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  copies     :integer          default(0)
#  shop_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
  belongs_to :book
  belongs_to :shop

  validates :book, :shop, :copies, presence: true
end
