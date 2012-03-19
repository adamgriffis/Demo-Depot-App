class GeneratePriceForLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |item|
      item.price = item.product.price * item.quantity
      item.save
    end
  end

  def down
  end
end
