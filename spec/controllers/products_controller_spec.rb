require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	describe "GET #new" do
		context "User is signed in " do
			it "renders the new template" do
				user = FactoryGirl.create(:business_user)

				sign_in user
				get :new

				expect(response).to render_template :new
			end
		end

		context "User is not signed in " do
			it "should redirect to the login page" do
				get :new

				expect(response).to redirect_to new_business_user_session_path
			end
		end
	end

	describe "POST #create" do
		context "params are valid" do
			it "creates a new product" do
				user = FactoryGirl.create(:business_user)

				sign_in user
				expect {
					post :create, product: FactoryGirl.attributes_for(:product)				
				}.to change(Product,:count).by (1)
			end

			it "redirects the user to root path" do
				user = FactoryGirl.create(:business_user)

				sign_in user
				post :create, product: FactoryGirl.attributes_for(:product)		

				expect(response).to redirect_to products_path
			end
		end

		context "params are not valid" do 
			it "doesn't create a new product" do
				user = FactoryGirl.create(:business_user)

				sign_in user
				expect {
					post :create, product: FactoryGirl.attributes_for(:product, title: nil)
				}.to change(Product,:count).by (0)			
			end

			it "renders the new template" do
				user = FactoryGirl.create(:business_user)

				sign_in user
				post :create, product: FactoryGirl.attributes_for(:product, title: nil)		
				
				expect(response).to render_template :new
			end
		end
	end
end
