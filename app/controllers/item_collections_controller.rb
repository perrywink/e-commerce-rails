# class ItemCollectionsController < ApplicationController
#   def index
#   end
  
#   def new
#     @item_collection = ItemCollection.new
#   end

#   def create
#     @item_collection = ItemCollection.new(item_collection_params)
    
#     respond_to do |format|
#       if @item_collection.save
#         format.html { redirect_to @item_collection, notice: "Item could not be put into Collection." }
#         format.json { render :show, status: :created, location: @item_collection }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @item_collection.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#     @item_collection.destroy
#     respond_to do |format|
#       format.html { redirect_to items_path, notice: "Item was successfully removed from collection." }
#       format.json { head :no_content }
#     end
#   end
  
#   private
  
#   def item_collection_params
#     params.require(:item_collection).permit(:item_id, :collection_id)
#   end
# end
