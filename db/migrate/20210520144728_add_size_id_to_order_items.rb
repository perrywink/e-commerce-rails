class AddSizeIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :size_id, :integer
  end
end
