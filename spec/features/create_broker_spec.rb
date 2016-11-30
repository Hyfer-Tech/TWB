require 'rails_helper'

RSpec.describe "Broker Signing Up" do

  scenario "successfully" do
    broker = FactoryGirl.create(:broker)
    visit new_broker_registration_path
    fill_in "First Name", with: broker.first_name
    fill_in "Last Name", with: broker.last_name
    #fill_in "broker_email", with: "example@user.com", exact: true
    find(:css, ".broker_sign_up_form input[id$='broker_email']").set("example@user.com")
    fill_in "Password", with: broker.password, match: :prefer_exact
    fill_in "Password Confirmation", with: broker.password_confirmation
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
    # attach_file("Avatar", Rails.root + "spec/fixtures/files/5.png", visible: false)
    fill_in "Broker Number", with: broker.broker_number
    #find('input[name="commit"]').click
    find('input[id="sign_up_button"]').click
    
    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
  end

  # scenario "unsuccessfully" do
  #   broker = FactoryGirl.create(:broker)
  #   visit new_broker_registration_path
  #   fill_in "First Name", with: ""
  #   fill_in "Last Name", with: ""
  #   fill_in "broker_email", with: "example@user.com"
  #   fill_in "Password", with: broker.password, match: :prefer_exact
  #   fill_in "Password Confirmation", with: broker.password_confirmation
  #   fill_in "Description", with: broker.description
  #   fill_in "Phone",with: broker.phone
  #   fill_in "Firm name",with: broker.firm_name
  #   fill_in "Address Line 1",with: broker.address_line_1
  #   fill_in "City",with: broker.city
  #   fill_in "Zip/Postal/Code", with: broker.zip_postal_code
  #   fill_in "State/Province/County", with: broker.state_province_county    
  #   select "Nepal", from: "broker[country]"
  #   fill_in "Specialty", with: broker.specialty
  #   fill_in "Past Experience", with: broker.past_experience
  #   fill_in "Service Rate", with: broker.service_rates
  #   # attach_file("Avatar", Rails.root + "spec/fixtures/files/5.png", visible: false)
  #   fill_in "Broker Number", with: ""
  #   find('input[name="commit"]').click

  #   expect(page).to_not have_content("A message with a confirmation link has been sent to your email address")
  # end
end