require 'rails_helper'

RSpec.describe "User Signing Up" do
  scenario "successfully" do
    user = FactoryGirl.build(:business_user)

    visit new_business_user_registration_path
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: "someone@example.com"
    fill_in "Password", with: user.password, :match => :prefer_exact
    fill_in "Password confirmation", with: user.password_confirmation, :match => :prefer_exact
    fill_in "Phone", with: user.phone
    fill_in "Description", with: user.description
    fill_in "Address line 1", with: user.address_line_1
    fill_in "Address line 2", with: user.address_line_2
    fill_in "Address line 3", with: user.address_line_3
    fill_in "City", with: user.city
    fill_in "State/Province/County", with: user.state_province_county
    # fill_in "Country", with: user.country
    select "Nepal", from: "business_user[country]"
    find('input[name="commit"]').click

    expect(page).to have_link(nil, href: '/users/profile')


  end
end
