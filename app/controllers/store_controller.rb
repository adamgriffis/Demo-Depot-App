class StoreController < ApplicationController
  def index
      @products = Product.all
      @visits = increment_count
      @cart = current_cart
  end
end
