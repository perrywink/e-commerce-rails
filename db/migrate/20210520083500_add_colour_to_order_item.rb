class AddColourToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :colour_id, :integer
  end
end
