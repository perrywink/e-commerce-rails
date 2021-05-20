class CreateItemColours < ActiveRecord::Migration[5.2]
  def change
    create_table :item_colours do |t|
      t.integer :item_id
      t.integer :colour_id

      t.timestamps
    end
  end
end
