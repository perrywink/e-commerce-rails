class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      t.string :image

      t.timestamps
    end
  end
end
