FactoryGirl.define do
  factory :broker do
    sequence :email do |n|
      "random_broker#{n}@email.com"
    end
    password "userpassword"
    password_confirmation "userpassword"
    first_name "Broker"
    last_name "Cullens"
    phone "9800000000"
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    address_line_1 "15 Avenue"
    address_line_2 "Bark Street"
    address_line_3 "Johnson Road"
    firm_name "Firm"
    city "Durham"
    state_province_county "North Carolina"
    country "US"
    zip_postal_code "12345"
    service_rates "24"  
    specialty "specialty"
    broker_number "1235"
  end
end