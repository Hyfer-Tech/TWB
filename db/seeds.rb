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

# BusinessUser.create(first_name: "", last_name: "", email: "", business_name: "", phone: "", description: "", address_line_1: "", city: "", state_province_county: "", country: "", avatar: "", account_type: )


# Broker.create(first_name: "", last_name: "", email: "", description: "", phone: "", firm_name: "", address_line_1: "", city:"", zip_postal_code: , state_province_county: "", country: "", specialty:"", past_experience: "", service_rates: ,avatar: "", broker_number: "", verified_flag: )

UserLimit.create(amount: 5, user_type: "business_user", limit_type: :job_post_limit)
UserLimit.create(amount: 15, user_type: "Forward Freight", limit_type: :bid_limit )
UserLimit.create(amount: 10, user_type: "Broker", limit_type: :bid_limit)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
