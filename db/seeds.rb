# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def create_users
  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
  25.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email 
    User.create(f_name: first_name, l_name: last_name, password: "password", password_confirmation: "password", email: email, uid: email, provider: 'email')
  end
end

def create_items
  5.times do
    category = Faker::Name.first_name
    2.times do
      name = Faker::Name.last_name
      total = 50
      remaining_quantity = 50
      Item.create(category: category, name: name, description: '', quantity: total, remaining_quantity: remaining_quantity)
    end
  end
end

# create_items
def create_items_new
  item_code_base = 20750122
  10.times do |i|
    categories = ['19SEP/C-30/D5', '19SEP/C-30/D4', '19SEP/C-30/D3', '19SEP/C-30/D2','19SEP/C-30/D1']
    lot_no = categories.sample
    qty = 750
    Item.create({
      'category': lot_no,
      'item_code': (item_code_base + i).to_s,
      'name': 'Sodium Nitrate',
      'description': 'Sodium Nitrite Std - 50 Kg Bag',
      'lot_no': lot_no,
      'primary_qty': '35.45',
      'primary_uom': 'MT',
      'secondary_qty': qty,
      'secondary_uom': 'BAG',
      'quantity': qty,
      'remaining_quantity': qty
    })
  end
end
# create_items_new

def create_booked_order
  categories = ['19SEP/C-30/D5', '19SEP/C-30/D4', '19SEP/C-30/D3', '19SEP/C-30/D2','19SEP/C-30/D1']
  so_no_base =  2000551
  item_code_base = 20750122
  categories.each_with_index.each do |lot, index|
    item_desc = 'Sodium Nitrite Std - 50 Kg Bag'
    lot_no = lot
    item_code = item_code_base + index
    so_no = so_no_base + index
    primary_qty = 35.45
    primary_uom = 'MT'
    secondary_qty = (primary_qty * 1000)/50
    secondary_uom = 'BAG'
    load_bags = secondary_qty
    BookedOrder.create({
      item_code: item_code,
      item_desc: item_desc,
      lot_no: lot_no,
      so_number: so_no,
      load_bags: load_bags,
      primary_qty: primary_qty,
      primary_uom: primary_uom,
      secondary_qty: secondary_qty,
      secondary_uom: secondary_uom
    })
  end
end
create_booked_order