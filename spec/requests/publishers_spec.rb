require 'rails_helper'

RSpec.describe 'Publisher Endpoint', type: :request do
  let!(:publisher)   { create :publisher }
  let(:publisher_id) { publisher.id }

  describe 'GET /publisher/id' do
    before { get "/publishers/#{publisher_id}" }

    context 'when publisher is found' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the publisher' do
        expect(json).not_to be_empty
      end
    end

    context 'when publisher is not found' do
      let(:publisher_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Publisher/)
      end
    end
  end
end
