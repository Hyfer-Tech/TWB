# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# BusinessUser.create(first_name: "", last_name: "", email: "", business_name: "", phone: "", description: "", address_line_1: "", city: "", state_province_county: "", country: "", avatar: "", account_type: )


# Broker.create(first_name: "", last_name: "", email: "", description: "", phone: "", firm_name: "", address_line_1: "", city:"", zip_postal_code: , state_province_county: "", country: "", specialty:"", past_experience: "", service_rates: ,avatar: "", broker_number: "", verified_flag: )

UserLimit.create(amount: 5, user_type: "Business User", limit_type: :job_post_limit)
UserLimit.create(amount: 15, user_type: "Forward Freight", limit_type: :bid_limit )
UserLimit.create(amount: 10, user_type: "Broker", limit_type: :bid_limit)