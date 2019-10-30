class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
