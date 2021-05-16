class HomeController < ApplicationController
  def index
    @items = Item.order('popularity DESC').first(4)
    @collection = Collection.all
    
    offset = rand(Item.count)
    @rand_item = Item.offset(offset).first
  end
end
