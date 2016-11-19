require 'rails_helper'

RSpec.describe BusinessUsersController, type: :controller do
	describe "GET #show" do
		it "renders the show template" do
			business_user = FactoryGirl.create(:business_user)

      get :show, id: business_user.id

      expect(response).to render_template :show
		end
	end
end
