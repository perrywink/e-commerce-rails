class ShoppingBagsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    if current_user.order
      @order_items = current_user.order.order_items.order("created_at DESC")
    else
      @order_items = current_user.build_order.order_items.order("created_at DESC")
    end
  end
  
  def checkout
    current_user.order.destroy
    # session[:order_id] = nil
    redirect_to root_path, flash: { success: "Transaction successful!" }
  end
  
end
