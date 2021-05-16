class Collection < ApplicationRecord
    # When a collection is deleted, only the item-collection link gets deleted.
    # Items can exist outside any collection.
    has_many :item_collections, dependent: :delete_all
    has_many :items, through: :item_collections
    
    has_one_attached :image
end
