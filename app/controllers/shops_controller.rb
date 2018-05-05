class ShopsController < ApplicationController

  # For a specific Shop it should mark one or multiple copies of a book as sold.
  def sell
    stock = Stock.find_by!(shop_id: params[:shop_id], book_id: params[:id])
    copies = [stock.copies - params[:copies].to_i, 0].max

    stock.update(copies: copies)

    head :no_content
  end
end
