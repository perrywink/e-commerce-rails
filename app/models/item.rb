class Item < ApplicationRecord
    has_many :item_collections, dependent: :delete_all
    has_many :collections, through: :item_collections
    
    has_one_attached :image
    
    def thumbnail
        self.image.variant(resize: '300x300').processed
    end
end
