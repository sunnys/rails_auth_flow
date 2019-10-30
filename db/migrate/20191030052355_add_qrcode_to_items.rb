class AddQrcodeToItems < ActiveRecord::Migration[6.0]
  def change
    # add_column :items, :qrcode, :string
    add_column :items, :qrcode, :string
  end
end
