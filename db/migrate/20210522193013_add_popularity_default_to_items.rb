class AddPopularityDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :popularity, 0
  end
end
