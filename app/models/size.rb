class Size < ApplicationRecord
    has_many :item_sizes
    has_many :items, through: :item_sizes
    
    def size_label
        label.upcase
    end
end
