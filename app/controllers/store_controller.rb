class StoreController < ApplicationController
  def index
      @products = Product.all
      @visits = increment_count
  end
end
