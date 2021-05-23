class OrderItemsController < ApplicationController
  before_action :authenticate_user!,only: %i[ update destroy ]
  
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    
    if @order.save!
      @order_item.item.popularity += 1
      @order_item.item.save
      session[:order_id] = @order.id
      redirect_to shopping_bags_show_path, flash: { success: "Item added to bag!" }
    else
      redirect_back fallback_location: root_path, flash: { warning: "Error occured while adding to bag!" }
    end
  end
  
  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_back(fallback_location: root_path)
  end
  
  
  
  private
  
  def order_params
    params.require(:order_item).permit(:item_id, :quantity, :colour_id, :size_id)
  end
end
