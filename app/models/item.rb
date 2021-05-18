class Item < ApplicationRecord
    has_many :item_collections, dependent: :delete_all
    has_many :collections, through: :item_collections
    
    # has_one_attached :image
    has_many_attached :images
    
    def primary_img
      self.images[0].variant(combine_options: {thumbnail: "500x500^", gravity: "center", extent: "500x500"}).processed
    end
    
    def thumbnail image
      image.variant(combine_options: {thumbnail: "500x500^", gravity: "center", extent: "500x500"}).processed
    end
    
end