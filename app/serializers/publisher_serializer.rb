class PublisherSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :shops

  def shops
    shops = []

    @object.shops.each do |shop|
      shop_hash = {
        id: shop.id,
        name: shop.name,
        books_sold_count: shop.books_sold_count,
        books_in_stock: []
      }

      shop.books.in_stock.where(publisher: @object).each do |b|
        shop_hash[:books_in_stock] << {
          id: b.id,
          title: b.title,
          copies_in_stock: b.stocks.find_by(shop: shop).copies
        }
      end

      shops << shop_hash
    end

    shops
  end
end
