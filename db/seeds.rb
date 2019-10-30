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
      Item.create(category: category, name: name, decription: '', quantity: total, remaining_quantity: remaining_quantity)
    end
  end
end
create_items
