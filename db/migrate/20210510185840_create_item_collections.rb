class CreateItemCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :item_collections do |t|
      t.integer :item_id
      t.integer :collection_id

      t.timestamps
    end
  end
end
