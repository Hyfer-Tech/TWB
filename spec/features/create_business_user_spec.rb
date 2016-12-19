require 'rails_helper'

RSpec.describe "User Signing Up" do
  scenario "successfully" do
    user = FactoryGirl.build(:business_user)

    visit new_business_user_registration_path
    fill_in "business_user_first_name", with: user.first_name
    fill_in "business_user_last_name", with: user.last_name
    fill_in "sign_up_business_user_email", with: user.email
    fill_in "business_user_sign_up_password", with: user.password, :match => :prefer_exact
    fill_in "business_user_password_confirmation", with: user.password_confirmation, :match => :prefer_exact
    fill_in "business_user_phone", with: user.phone
    fill_in "business_user_description", with: user.description
    fill_in "business_user_address_line_1", with: user.address_line_1
    fill_in "business_user_address_line_2", with: user.address_line_2
    fill_in "business_user_address_line_3", with: user.address_line_3
    fill_in "business_user_city", with: user.city
    fill_in "business_user_state", with: user.state_province_county
    fill_in "business_user_zip_postal_code", with:user.zip_postal_code
    select "Nepal", from: "business_user[country]"

    find(:css, "input[id='sign_up_button_business']").click

    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
  end
end
