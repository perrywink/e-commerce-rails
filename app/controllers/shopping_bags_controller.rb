class ShoppingBagsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @order_items = current_order.order_items.order("created_at DESC")
  end
  
  def checkout
    current_order.update_attributes(purchased_at: Time.now)
    redirect_to root_path, flash: { success: "Transaction successful!" }
  end
  
end
