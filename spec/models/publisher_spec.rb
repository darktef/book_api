require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it { is_expected.to have_many :books }
  it { is_expected.to have_many(:stocks).through(:books) }

  it { is_expected.to validate_presence_of :name }

  describe '#shops' do
    let!(:stocks)   { create_list(:stock, 3) }
    let(:book)      { stocks.first.book }
    let(:publisher) { book.publisher }

    it 'knows its shops' do
      expect(publisher.shops).to eq book.shops
    end
  end
end
