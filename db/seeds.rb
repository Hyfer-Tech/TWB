tag_list = ["Mineral Products","Wood Products","Metals","Stone and Glass",
            "Animal and Vegetable Bi-Products","Paper Goods","Vegetable Products",
            "Animal Products","Foodstuffs","Weapons","Footwear and Headwear",
            "Animal Hides","Textiles","Transportation","Machines","Arts and Antiques",
            "Precious Metals","Chemical Products","Instruments","Plastics and Rubbers",
            "Miscellaneous"]

tag_list.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

