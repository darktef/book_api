require 'rails/helper'

RSpec.describe 'Shop Endpoint', type: :request do
  let!(:shop)   { create :shop }
  let(:shop_id) { shop.id }

  describe 'POST /shops/id/sell' do
    before { post "/shops/#{shop_id}/sell" }

    context 'when the request is valid' do
      let(:valid_params) {}

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the shop' do
        expect(json).not_to be_empty
      end
    end

    context 'when the request is invalid' do
      let(:invalid_params) {}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
