class AddColumnItemCodeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_code, :string
    add_column :items, :primary_qty, :integer
    add_column :items, :primary_uom, :string
    add_column :items, :secondary_qty, :integer
    add_column :items, :secondary_uom, :string
    add_column :items, :lot_no, :string
  end
end
