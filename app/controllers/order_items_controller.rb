class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    if @order.save
      session[:order_id] = @order.id
      flash[:success] = "Item added to cart!"
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
    params.require(:order_item).permit(:item_id, :quantity)
  end
end
