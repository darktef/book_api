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
  validates :shop_id, uniqueness: { scope: [:book_id] }

  scope :in_stock, -> { where('copies > ?', 0) }

  before_update :update_book_sold_count_on_shop, if: ->(obj) { obj.copies_changed? }

  # Update the book sold count on shop whenever one or more copies
  # of book are sold
  def update_book_sold_count_on_shop
    diff = changes['copies'].reduce(&:-)

    return if diff < 0
    sold = shop.books_sold_count + diff
    shop.update(books_sold_count: sold)
  end
end
