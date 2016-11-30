require 'rails_helper'

RSpec.describe "Broker Signing Up" do

  scenario "successfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path
    find(:css, "#broker_sign_up_form  input[id$='broker_first_name']").set(broker.first_name)
    find(:css, "#broker_sign_up_form  input[id$='broker_last_name']").set(broker.last_name)
    find(:css, "#broker_sign_up_form  input[id$='broker_email']").set("example@user.com")
    find(:css, "#broker_sign_up_form  input[id$='broker_password']").set(broker.password)
    find(:css, "#broker_sign_up_form  input[id$='broker_password_confirmation']").set(broker.password_confirmation)
    find(:css, "#broker_sign_up_form  input[id$='broker_description']").set(broker.description)
    find(:css, "#broker_sign_up_form  input[id$='broker_phone']").set(broker.phone)
    find(:css, "#broker_sign_up_form  input[id$='broker_firm_name']").set(broker.firm_name)
    find(:css, "#broker_sign_up_form  input[id$='broker_address_line_1']").set(broker.address_line_1)
    find(:css, "#broker_sign_up_form  input[id$='broker_city']").set(broker.city)
    find(:css, "#broker_sign_up_form  input[id$='broker_zip_postal_code]").set(broker.zip_postal_code)
    find(:css, "#broker_sign_up_form  input[id$='broker_state_province_county']").set(broker.state_province_county)
    find(:css, "#broker_sign_up_form  input[id$='broker_country']").set("Nepal")
    find(:css, "#broker_sign_up_form  input[id$='broker_specialty']").set(broker.specialty)
    find(:css, "#broker_sign_up_form  input[id$='broker_past_experience']").set(broker.past_experience)
    find(:css, "#broker_sign_up_form  input[id$='broker_service_rates']").set(broker.service_rates)
    find(:css, "#broker_sign_up_form  input[id$='broker_broker_number']").set(broker.broker_number)
    find(:css, "input[id='sign_up_button_broker']").click
    
    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
  end

  scenario "unsuccessfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path
    find(:css, "#broker_sign_up_form  input[id$='broker_first_name']").set("")
    find(:css, "#broker_sign_up_form  input[id$='broker_last_name']").set("")
    find(:css, "#broker_sign_up_form  input[id$='broker_email']").set("example@user.com")
    find(:css, "#broker_sign_up_form  input[id$='broker_password']").set(broker.password)
    find(:css, "#broker_sign_up_form  input[id$='broker_password_confirmation']").set(broker.password_confirmation)
    find(:css, "#broker_sign_up_form  input[id$='broker_description']").set(broker.description)
    find(:css, "#broker_sign_up_form  input[id$='broker_phone']").set(broker.phone)
    find(:css, "#broker_sign_up_form  input[id$='broker_firm_name']").set(broker.firm_name)
    find(:css, "#broker_sign_up_form  input[id$='broker_address_line_1']").set(broker.address_line_1)
    find(:css, "#broker_sign_up_form  input[id$='broker_city']").set(broker.city)
    find(:css, "#broker_sign_up_form  input[id$='broker_zip_postal_code]").set(broker.zip_postal_code)
    find(:css, "#broker_sign_up_form  input[id$='broker_state_province_county']").set(broker.state_province_county)
    find(:css, "#broker_sign_up_form  input[id$='broker_country']").set("Nepal")
    find(:css, "#broker_sign_up_form  input[id$='broker_specialty']").set(broker.specialty)
    find(:css, "#broker_sign_up_form  input[id$='broker_past_experience']").set(broker.past_experience)
    find(:css, "#broker_sign_up_form  input[id$='broker_service_rates']").set(broker.service_rates)
    find(:css, "#broker_sign_up_form  input[id$='broker_broker_number']").set(broker.broker_number)
    find(:css, "input[id='sign_up_button_broker']").click

    expect(page).to_not have_content("A message with a confirmation link has been sent to your email address")
  end
end