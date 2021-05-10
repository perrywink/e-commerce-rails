class Collection < ApplicationRecord
    has_many :item_collections
    has_many :items, through: :item_collections
end
