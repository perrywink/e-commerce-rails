class Collection < ApplicationRecord
    # When a collection is deleted, only the item-collection link gets deleted.
    # Items can exist outside any collection.
    has_many :item_collections, dependent: :delete_all
    has_many :items, through: :item_collections
    
    has_one_attached :image
    
    def thumbnail
        self.image.variant(combine_options: {thumbnail: "500x500^", gravity: "center", extent:"500x500"}).processed
    end

end

