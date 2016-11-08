FactoryGirl.define do
  factory :broker do
    first_name "lorem"
    last_name "ipsum"
    email "apple@example.com"
    password "password"
    password_confirmation "password"
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio inventore facere voluptate voluptatum animi repudiandae excepturi cum, nisi hic qui, accusamus fugit blanditiis. Accusamus minus consequatur odio reprehenderit odit accusantium."
    phone "12345678"
    firm_name "Apple Firm"
    address_line_1 "Apple Street"
    city "Apple"
    zip_postal_code "425846"
    state_province_county "Apple, apple ,apple"
    country "Nepal"
    specialty "Apartments"
    past_experience "5 years of professional experience"
    service_rates "1500"
    avatar "photo"
    broker_number "4841819"
  end
end