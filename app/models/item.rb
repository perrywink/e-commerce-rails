class Item < ApplicationRecord
    has_many :item_collections, dependent: :delete_all
    has_many :collections, through: :item_collections
    
    has_many :order_items
    
    has_many :item_colours
    has_many :colours, through: :item_colours
    
    has_many :item_sizes
    has_many :sizes, through: :item_sizes
    
    
    # has_one_attached :image
    has_many_attached :images
    
    def primary_img
      self.images[0].variant(combine_options: {thumbnail: "500x500^", gravity: "center", extent: "500x500"}).processed
    end
    
    def thumbnail image
      image.variant(combine_options: {thumbnail: "500x500^", gravity: "center", extent: "500x500"}).processed
    end
    
end