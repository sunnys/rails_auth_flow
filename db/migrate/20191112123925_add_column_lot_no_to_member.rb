class AddColumnLotNoToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :lot_no, :string
  end
end
