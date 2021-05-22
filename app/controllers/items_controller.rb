class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy save_into_list remove_from_list ]
  before_action :authorized_as_admin, only: %i[ new edit create update destroy ]
  

  # GET /items or /items.json
  def index
    @items = Item.all

    if !params[:item].nil?
      # @items = Item.includes(:collections).where(
      #     collections: {id: params[:item][:collection_ids]}
      #   )if !params[:item][:collection_ids].nil?
        
      # @items = Item.includes(:colours).where(
      #     colours: {id: params[:item][:colour_ids]}
      #   ).uniq if !params[:item][:colour_ids].nil?
        
      # @items = Item.includes(:sizes).where(
      #     sizes: {id: params[:item][:size_id]}
      #   ).uniq if !params[:item][:size_id].empty?
      
      @items = Item.includes(:collections).includes(:colours).includes(:sizes)
          .where(collections: {id: params[:item][:collection_ids]})
          .where(colours: {id: params[:item][:colour_ids]})
          .where(sizes: {id: params[:item][:size_id]})
      
    end
    
    
      
  end
  
  
  # GET /items/1 or /items/1.json
  def show
    if user_signed_in?
      if !current_user.order
        @order_item = current_user.build_order.order_items.new
      else
        @order_item = current_user.order.order_items.new
      end
      
    else
      order = Order.new
      @order_item = order.order_items.new
    end
    
    # @order_item = current_order.order_items.new
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end
  
  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    
    #random popularity score assigned between 1-10 (pass level)
    @item.popularity = (rand()*10).to_i

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully removed." }
      format.json { head :no_content }
    end
  end
  
  def save_list
    @items = Item.all
    @saved_list = session[:saved_list]
  end
  
  def save_into_list
    @saved_list = session[:saved_list]
    
    unless @saved_list
      @saved_list = []
    end
    
    if @item
      # cannot use :id here because of JSON semantics
      if @saved_list.none?{|i| i["id"] == @item.id }
        @saved_list << @item
        redirect_to root_path, flash: { success: "Item saved!" }
      else
        redirect_to root_path, flash: { warning: "Item already saved!" }
      end
      
      puts @saved_list.inspect
    end
    session[:saved_list] = @saved_list
  end


  def remove_from_list
    @saved_list = session[:saved_list]
    if @item
      if @saved_list.delete_if{|i| i["id"] == @item.id }
        redirect_to root_path, flash: { success: "Item removed from list!" }
      else
        redirect_to root_path, flash: { warning: "You cannot remove an unsaved item!" }
      end
    end
    puts @saved_list.inspect
    session[:saved_list] = @saved_list
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, images:[], collection_ids:[])
    end
  
end
