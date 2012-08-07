# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create({:email => "zombie@reviews.com", :password =>'zombie87'})
user2 = User.create({:email => "brains@reviews.com", :password =>'zombie87'})

product1 = Product.create({:name =>'Super Axe', :model_number => 42})
product2 = Product.create({:name =>'Chainsaw', :model_number => 32})
product3 = Product.create({:name =>'Machine Gun', :model_number => 22})

Review.create({:rating => 3, :comment => "Kills all zombies!", :user_email => user1.email, :user_id => user1.id, :product_id => product1.id})
Review.create({:rating => 5, :comment => "Kills all zombies fast", :user_email => user1.email, :user_id => user1.id, :product_id => product2.id})
Review.create({:rating => 1, :comment => "Sucks at killing zombies", :user_email => user1.email, :user_id => user1.id, :product_id => product3.id})

Review.create({:rating => 1, :comment => "Makes brain matter fly all over", :user_email => user2.email, :user_id => user2.id, :product_id => product1.id})
Review.create({:rating => 2, :comment => "It was ok, broke on the first swing", :user_email => user2.email, :user_id => user2.id, :product_id => product2.id})
Review.create({:rating => 5, :comment => "I loved it!", :user_email => user2.email, :user_id => user2.id, :product_id => product3.id})

