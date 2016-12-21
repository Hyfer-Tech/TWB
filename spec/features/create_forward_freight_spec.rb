require 'rails_helper'

RSpec.describe "User Signing Up" do
  scenario "successfully" do
    user = FactoryGirl.build(:forward_freight)

    visit new_forward_freight_registration_path
    fill_in "forward_freights_first_name", with: user.first_name
    fill_in "forward_freights_last_name", with: user.last_name
    fill_in "forward_freights_email", with: "someone@example.com"
    fill_in "forward_freights_password", with: user.password, :match => :prefer_exact
    fill_in "forward_freights_password_confirmation", with: user.password_confirmation, :match => :prefer_exact
    fill_in "forward_freights_phone", with: user.phone
    fill_in "forward_freights_description", with: user.description
    fill_in "forward_freights_address_line_1", with: user.address_line_1
    fill_in "forward_freights_address_line_2", with: user.address_line_2
    fill_in "forward_freights_address_line_3", with: user.address_line_3
    fill_in "forward_freights_city", with: user.city
    fill_in "forward_freights_state_province_country", with: user.state_province_county
    fill_in "forward_freights_zip_postal_code", with: user.zip_postal_code
    fill_in "forward_freights_service_rate", with: user.service_rates
    select "Nepal", from: "forward_freight[country]"

    find(:css, "input[id='sign_up_button_forward_freight']").click

    expect(page).to have_content("A message with a confirmation link has been sent to your email address")

  end
end
