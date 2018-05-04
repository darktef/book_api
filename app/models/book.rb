# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  title        :string
#  publisher_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ApplicationRecord
  belongs_to :publisher

  has_many :stocks
  has_many :shops, through: :stocks

  validates :publisher, :title, presence: true
end
