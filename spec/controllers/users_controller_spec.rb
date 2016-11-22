require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #profile" do
    context "user is signed in" do
      it "should render profile template" do
        business_user = FactoryGirl.create(:business_user)

        sign_in business_user
        get :profile

        expect(response).to render_template :profile
      end
    end
  end

  describe "GET #saved" do
    context "user is signed in" do
      it "should render saved template" do
        business_user = FactoryGirl.create(:business_user)

        sign_in business_user
        get :saved

        expect(response).to render_template :saved
      end
    end
  end
end
