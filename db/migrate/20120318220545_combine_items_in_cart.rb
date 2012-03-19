class CombineItemsInCart < ActiveRecord::Migration
  def up
    # replace multiple line items for a cart and product with one 
    product_ids = Array.new
    
    Product.all.each do |product|
      product_ids.push(product.id)
    end
    
    Cart.all.each do |cart|
      cart.line_items.where("product_id not in (?)", Product.all.map(&:id)).delete_all
      results = cart.line_items.group(:product_id).sum(:quantity)
      
      results.each do |product_id, quantity|
        cart.line_items.where(:product_id => product_id).delete_all
        
        cart.line_items.create(:product_id => product_id, :quantity => quantity)
      end
    end
  end

  def down
  end
end
