require 'rails_helper'

RSpec.describe "Broker Signing Up" do

  scenario "successfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path
    # find(:css, "#broker_sign_up_form  input[id$='broker_first_name']").set(broker.first_name)
    # find(:css, "#broker_sign_up_form  input[id$='broker_last_name']").set(broker.last_name)
    # find(:css, "#broker_sign_up_form  input[id$='broker_email']").set("example@user.com")
    # find(:css, "#broker_sign_up_form  input[id$='broker_password']").set(broker.password)
    # find(:css, "#broker_sign_up_form  input[id$='broker_password_confirmation']").set(broker.password_confirmation)
    # find(:css, "#broker_sign_up_form  textarea[id$='broker_description']").set(broker.description)
    # find(:css, "#broker_sign_up_form  input[id$='broker_phone']").set(broker.phone)
    # find(:css, "#broker_sign_up_form  input[id$='broker_firm_name']").set(broker.firm_name)
    # find(:css, "#broker_sign_up_form  input[id$='broker_address_line_1']").set(broker.address_line_1)
    # find(:css, "#broker_sign_up_form  input[id$='broker_city']").set(broker.city)
    # find(:css, "#broker_sign_up_form  input[id$='broker_zip_postal_code']").set(broker.zip_postal_code)
    # find(:css, "#broker_sign_up_form  input[id$='broker_state_province_county']").set(broker.state_province_county)
    # find(:css, "#broker_sign_up_form  select[id$='broker_country']").set("Nepal")
    # find(:css, "#broker_sign_up_form  input[id$='broker_specialty']").set(broker.specialty)
    # find(:css, "#broker_sign_up_form  input[id$='broker_past_experience']").set(broker.past_experience)
    # find(:css, "#broker_sign_up_form  input[id$='broker_service_rates']").set(broker.service_rates)
    # find(:css, "#broker_sign_up_form  input[id$='broker_broker_number']").set(broker.broker_number)

    fill_in "First Name", with: broker.first_name
    fill_in "Last Name", with: broker.last_name
    fill_in "sign_up_broker_email", with: "example@user.com"
    fill_in "sign_up_broker_password", with: broker.password, match: :prefer_exact
    fill_in "sign_up_broker_password_confirmation", with: broker.password_confirmation
    fill_in "Description", with: broker.description
    fill_in "Phone",with: broker.phone
    fill_in "Firm name",with: broker.firm_name
    fill_in "Address Line 1",with: broker.address_line_1
    fill_in "City",with: broker.city
    fill_in "Zip/Postal/Code", with: broker.zip_postal_code
    fill_in "State/Province/County", with: broker.state_province_county
    select "Nepal", from: "broker[country]"
    fill_in "Specialty", with: broker.specialty
    fill_in "Past Experience", with: broker.past_experience
    fill_in "Service Rate", with: broker.service_rates
    fill_in "Broker Number", with: broker.broker_number

    find(:css, "input[id='sign_up_button_broker']").click
    
    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
  end

  scenario "unsuccessfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path
    # find(:css, "#broker_sign_up_form  input[id$='broker_first_name']").set("")
    # find(:css, "#broker_sign_up_form  input[id$='broker_last_name']").set("")
    # find(:css, "#broker_sign_up_form  input[id$='broker_email']").set("example@user.com")
    # find(:css, "#broker_sign_up_form  input[id$='broker_password']").set(broker.password)
    # find(:css, "#broker_sign_up_form  input[id$='broker_password_confirmation']").set(broker.password_confirmation)
    # find(:css, "#broker_sign_up_form  textarea[id$='broker_description']").set(broker.description)
    # find(:css, "#broker_sign_up_form  input[id$='broker_phone']").set(broker.phone)
    # find(:css, "#broker_sign_up_form  input[id$='broker_firm_name']").set(broker.firm_name)
    # find(:css, "#broker_sign_up_form  input[id$='broker_address_line_1']").set(broker.address_line_1)
    # find(:css, "#broker_sign_up_form  input[id$='broker_city']").set(broker.city)
    # find(:css, "#broker_sign_up_form  input[id$='broker_zip_postal_code']").set(broker.zip_postal_code)
    # find(:css, "#broker_sign_up_form  input[id$='broker_state_province_county']").set(broker.state_province_county)
    # find(:css, "#broker_sign_up_form  select[id$='broker_country']").set("Nepal")
    # find(:css, "#broker_sign_up_form  input[id$='broker_specialty']").set(broker.specialty)
    # find(:css, "#broker_sign_up_form  input[id$='broker_past_experience']").set(broker.past_experience)
    # find(:css, "#broker_sign_up_form  input[id$='broker_service_rates']").set(broker.service_rates)
    # find(:css, "#broker_sign_up_form  input[id$='broker_broker_number']").set(broker.broker_number)
    
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "sign_up_broker_email", with: "example@user.com"
    fill_in "sign_up_broker_password", with: broker.password, match: :prefer_exact
    fill_in "sign_up_broker_password_confirmation", with: broker.password_confirmation
    fill_in "Description", with: broker.description
    fill_in "Phone",with: broker.phone
    fill_in "Firm name",with: broker.firm_name
    fill_in "Address Line 1",with: broker.address_line_1
    fill_in "City",with: broker.city
    fill_in "Zip/Postal/Code", with: broker.zip_postal_code
    fill_in "State/Province/County", with: broker.state_province_county
    select "Nepal", from: "broker[country]"
    fill_in "Specialty", with: broker.specialty
    fill_in "Past Experience", with: broker.past_experience
    fill_in "Service Rate", with: broker.service_rates
    fill_in "Broker Number", with: broker.broker_number
    find(:css, "input[id='sign_up_button_broker']").click

    expect(page).to_not have_content("A message with a confirmation link has been sent to your email address")
  end
end