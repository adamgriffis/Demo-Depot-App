class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def addProduct(product_id)
    current_item = line_items.where(:product_id => product_id).first
    
    logger.debug product_id
    
    if current_item.nil? 
      product = Product.find(product_id)
      current_item = line_items.build(:product_id => product_id, :price => product.price)
    else
      current_item.quantity += 1
      current_item.price += current_item.product.price
    end
    
    current_item
  end
  
  def total_price
    line_items.to_a.sum {|item| item.price}
  end
end
