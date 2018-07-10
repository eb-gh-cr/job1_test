class RenameItemsTableToProducts < ActiveRecord::Migration
  def up
    rename_table :items, :products
  end

  def down
    rename_table :products, :items
  end
end
