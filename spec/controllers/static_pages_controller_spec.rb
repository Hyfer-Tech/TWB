require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #index" do
    context "user is signed in" do
      it "redirects user to dashboard" do
        business_user = FactoryGirl.create(:business_user)

        sign_in business_user
        get :index

        expect(response).to redirect_to dashboard_path
      end
    end

    context "user is not signed in" do
      it "renders the index template" do
        get :index

        expect(response).to render_template :index
      end
    end
  end

end
