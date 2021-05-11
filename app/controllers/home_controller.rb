class HomeController < ApplicationController
  def index
    @items = Item.all
    @collection = Collection.all
    
    offset = rand(Item.count)
    @rand_item = Item.offset(offset).first
  end
end
