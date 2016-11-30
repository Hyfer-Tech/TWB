require 'rails_helper'

RSpec.describe "User Signing Up" do
  scenario "successfully" do
    user = FactoryGirl.build(:business_user)

    visit new_business_user_registration_path
    find(:css, "#business_sign_up_form input[id$='business_user_first_name']").set(user.first_name)
    find(:css, "#business_sign_up_form input[id$='business_user_last_name']").set(user.last_name)
    find(:css, "#business_sign_up_form input[id$='business_user_email']").set("example@user.com")
    find(:css, "#business_sign_up_form input[id$='business_user_password']").set(user.password)
    find(:css, "#business_sign_up_form input[id$='business_user_password_confirmation']").set(user.password_confirmation)
    find(:css, "#business_sign_up_form input[id$='business_user_phone']").set(user.phone)
    find(:css, "#business_sign_up_form input[id$='business_user_description']").set(user.description)
    find(:css, "#business_sign_up_form input[id$='business_user_address_line_1']").set(user.address_line_1)
    find(:css, "#business_sign_up_form input[id$='business_user_address_line_2']").set(user.address_line_2)
    find(:css, "#business_sign_up_form input[id$='business_user_address_line_3']").set(user.address_line_3)
    find(:css, "#business_sign_up_form input[id$='business_user_city']").set(user.city)
    find(:css, "#business_sign_up_form input[id$='business_user_state_province_county']").set(user.state_province_county)
    find(:css, "#business_sign_up_form input[id$='business_user_country']").set("Nepal")
    find(:css, "input[id='sign_up_button_business']").click

    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
  end
end
