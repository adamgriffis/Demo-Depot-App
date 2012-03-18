class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def current_cart
      Cart.find(session[:card_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:card_id] = cart.id
        cart
    end
    
    def increment_count
      if session[:visit_count].nil? then
        session[:visit_count] = 0
      else
        session[:visit_count] += 1
      end
      
      session[:visit_count]
    end

    def reset_count
      session[:visit_count] = 0
    end
end
