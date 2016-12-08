require 'rails_helper'

RSpec.describe User::JobsController, type: :controller do
	describe "GET #index" do
		context "User is signed in" do
			it "displays the user's jobs" do
				user = FactoryGirl.create(:business_user, email: "abc@a.a")

				sign_in user
				get :index

				expect(response).to render_template :index
			end
		end

		context "User is not signed in" do
			it "redirects the user to the root path" do
				get :index

				expect(response).to redirect_to root_path
			end
		end
	end
end
