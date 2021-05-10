class Item < ApplicationRecord
    has_many :item_collections
    has_many :collections, through: :item_collections
end
