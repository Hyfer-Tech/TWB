require 'rails_helper'

RSpec.describe ShipmentsController, type: :controller do
	describe "GET #new" do
		it "should render the new template" do
			user = FactoryGirl.create(:business_user)

			sign_in user
			get :new

			expect(response).to render_template :new
		end
	end

	describe "POST #create" do
		context "params are valid" do
			it "creates a new shipment" do
				user = FactoryGirl.create(:business_user)

				sign_in user

				expect {
					post :create, 
					shipment: FactoryGirl.attributes_for(:shipment, shipment_products_attributes: [ FactoryGirl.attributes_for(:shipment_product, product_id: 1) ])
				}.to change(Shipment, :count).by(1).and change(ShipmentProduct, :count ).by( 1 )
			end
		end

		context "params are invalid" do
			it "doesn't create a new shipment" do
				user = FactoryGirl.create(:business_user)

				sign_in user

				expect {
					post :create, shipment: FactoryGirl.attributes_for(:shipment, shipment_products_attributes: [])
				}.to change(Shipment, :count).by(0) 
			end
		end
		
	end
end
