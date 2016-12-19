
require 'rails_helper'

RSpec.describe "Broker Signing Up" do

  scenario "successfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path

    fill_in "broker_first_name", with: broker.first_name
    fill_in "broker_last_name", with: broker.last_name
    fill_in "sign_up_broker_email", with: "example@user.com"
    fill_in "sign_up_broker_password", with: broker.password, match: :prefer_exact
    fill_in "sign_up_broker_password_confirmation", with: broker.password_confirmation
    fill_in "broker_description", with: broker.description
    fill_in "broker_phone",with: broker.phone
    fill_in "broker_firm_name",with: broker.firm_name
    fill_in "broker_address_line_1",with: broker.address_line_1
    fill_in "broker_city",with: broker.city
    fill_in "broker_zip_postal_code", with: broker.zip_postal_code
    fill_in "broker_State", with: broker.state_province_county
    select "Nepal", from: "broker[country]"
    fill_in "broker_Specialty", with: broker.specialty
    fill_in "broker_past_experience", with: broker.past_experience
    fill_in "broker_service_rate", with: broker.service_rates
    fill_in "broker_number", with: broker.broker_number

    find(:css, "input[id='sign_up_button_broker']").click

    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
  end

  scenario "unsuccessfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path

    fill_in "broker_first_name", with: ""
    fill_in "broker_last_name", with: ""
    fill_in "sign_up_broker_email", with: "example@user.com"
    fill_in "sign_up_broker_password", with: broker.password, match: :prefer_exact
    fill_in "sign_up_broker_password_confirmation", with: broker.password_confirmation
    fill_in "broker_description", with: broker.description
    fill_in "broker_phone",with: broker.phone
    fill_in "broker_firm_name",with: broker.firm_name
    fill_in "broker_address_line_1",with: broker.address_line_1
    fill_in "broker_city",with: broker.city
    fill_in "broker_zip_postal_code", with: broker.zip_postal_code
    fill_in "broker_State", with: broker.state_province_county
    select "Nepal", from: "broker[country]"
    fill_in "broker_Specialty", with: broker.specialty
    fill_in "broker_past_experience", with: broker.past_experience
    fill_in "broker_service_rate", with: broker.service_rates
    fill_in "broker_number", with: broker.broker_number
    find(:css, "input[id='sign_up_button_broker']").click

    expect(page).to_not have_content("A message with a confirmation link has been sent to your email address")
  end
end
