require 'rails_helper'

RSpec.describe 'Shop Endpoint', type: :request do
  let!(:shop)   { create :shop }
  let!(:stock)  { create :stock, shop: shop, copies: 30 }
  let(:book)    { stock.book }
  let(:shop_id) { shop.id }
  let(:book_id) { book.id }
  let(:params) do
    { copies: 2 }
  end

  describe 'POST /shops/shop_id/books/:id/sell' do
    before { post "/shops/#{shop_id}/books/#{book_id}/sell", params: params }

    context 'when the request is valid' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'returns no content' do
        expect(response.body).to be_empty
      end

      it 'update the copies of stock' do
        expect(stock.reload.copies).to eq 28
      end
    end

    context 'when the request is invalid' do
      let(:book_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
