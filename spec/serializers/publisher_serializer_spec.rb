require 'rails_helper'

RSpec.describe PublisherSerializer, type: :serializer do
  let!(:publisher)    { create :publisher }
  let!(:books)        { create_list :book, 3, publisher: publisher }
  let!(:shops)        { create_list :shop, 2 }

  let(:book_a)        { books.first }
  let(:book_b)        { books.second }
  let(:book_c)        { books.third }

  let!(:shop_a)       { create :shop, books_sold_count: 7 }
  let!(:shop_b)       { create :shop, books_sold_count: 3 }

  let!(:stock_a)      { create :stock, book: book_a, shop: shop_a, copies: 3 }
  let!(:stock_b)      { create :stock, book: book_b, shop: shop_b, copies: 2 }
  let!(:stock_c)      { create :stock, book: book_c, shop: shop_a, copies: 1 }

  let(:serializer)    { described_class.new(publisher) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject)       { JSON.parse(serialization.to_json) }

  it 'knows its basic info' do
    expect(subject['id']).to eq publisher.id
    expect(subject['name']).to eq publisher.name
  end

  it 'knows its shops' do
    expect(subject['shops'].count).to eq 2
    expect(subject['shops'].first['name']).to eq shop_a.name
    expect(subject['shops'].first['books_sold_count']).to eq 7
  end

  it 'knows its books' do
    books = subject['shops'].first['books_in_stock']
    expect(books.count).to eq 2
    expect(books.first).to include('title' => book_a.title )
    expect(books.first).to include('copies_in_stock' => 3)
  end
end
