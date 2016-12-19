require 'rails_helper'

RSpec.describe User::ApplicationsController, type: :controller do
	describe "GET #index" do
		context "User is signed in" do
			context "User is a business user" do
				it "redirects the user to root path" do
					business_user = FactoryGirl.create(:business_user)

					sign_in business_user
					get :index

					expect(response).to redirect_to root_path
				end
			end

			context "User is a broker" do
				it "renders the index template" do
					broker = FactoryGirl.create(:broker)

					sign_in broker
					get :index

					expect(response).to render_template :index
				end
			end

			context "User is a forward freight" do
				it "renders the index template" do
					forward_freight = FactoryGirl.create(:forward_freight)

					sign_in forward_freight
					get :index

					expect(response).to render_template :index
				end
			end
		end

		context "User is not signed in" do
			it "redirects the user to root path" do
				get :index

				expect(response).to redirect_to root_path
			end
		end
	end

end
