class Colour < ApplicationRecord
    has_many :items
    
    has_many :item_colours
    has_many :items, through: :item_colours
    
    def capitalize_name
        name.capitalize
    end
end
