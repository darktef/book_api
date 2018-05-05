require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { is_expected.to belong_to :shop }
  it { is_expected.to belong_to :book }

  it { is_expected.to validate_presence_of :book }
  it { is_expected.to validate_presence_of :shop }
  it { is_expected.to validate_presence_of :copies }
  it { is_expected.to validate_uniqueness_of(:shop_id).scoped_to(:book_id) }

  describe '#update_book_sold_count_on_shop' do
    let!(:stock) { create :stock, copies: 30 }
    let(:shop)   { stock.shop }

    context 'when several copies are sold' do
      it 'will update the book sold count' do
        expect do
          stock.update(copies: 28)
        end.to change { shop.books_sold_count }.by 2
      end
    end

    context 'when new copies in the stock' do
      it 'will update the book sold count' do
        expect do
          stock.update(copies: 32)
        end.not_to change { shop.books_sold_count }
      end
    end
  end
end
