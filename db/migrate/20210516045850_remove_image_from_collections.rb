class RemoveImageFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :image
  end
end
