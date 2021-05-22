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
      image.variant(combine_options: {thumbnail: "600x600^", gravity: "center", extent: "600x600"}).processed
    end
    
    scope :filter_by_collection, -> (collection_ids) { includes(:collections).where( collections: {id: collection_ids} ) if !collection_ids.nil? }
    scope :filter_by_colour, -> (colour_ids) { includes(:colours).where( colours: {id: colour_ids}) if !colour_ids.nil? }
    scope :filter_by_size, -> (size_id) { includes(:sizes).where( sizes: {id: size_id}) if !size_id.blank? }
    
end