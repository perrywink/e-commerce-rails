class ShoppingBagsController < ApplicationController
  def show
    @order_items = current_order.order_items.order("created_at DESC")
  end
  
  def checkout
    current_order.destroy
    session[:order_id] = nil
    redirect_to root_path, flash: { success: "Transaction successful!" }
  end
  
end
