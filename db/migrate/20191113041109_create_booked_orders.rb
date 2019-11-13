class CreateBookedOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_orders do |t|
      t.string :item_code
      t.string :item_desc
      t.string :lot_no
      t.string :primary_qty
      t.string :primary_uom
      t.integer :secondary_qty
      t.string :secondary_uom
      t.string :so_number
      t.integer :load_bags

      t.timestamps
    end
  end
end
