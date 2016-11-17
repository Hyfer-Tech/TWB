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
		context "Business User is a free user" do
			context "Has created 5 jobs this month" do
				it "should not allow user to create anymore jobs this month" do
					user = FactoryGirl.create(:business_user, account_type: 0)

					sign_in user

					FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					# shipments = double("shipments")
					# this_month = double("this_month")
					# allow(user).to receive(:shipments).and_return(shipments)
					# allow(shipments).to receive(:this_month).and_return(this_month)
					# allow(this_month).to receive(:count).and_return(5)

					expect {
						post :create, shipment: FactoryGirl.attributes_for(:shipment)
					}.to change(Shipment, :count).by(0) 
				end
			end

			context "Has not created 5 jobs this month" do
				it "should allow user to create another job this month" do
					user = FactoryGirl.create(:business_user, account_type: 0)

					sign_in user

					shipment = FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)

					expect{
						post :create, shipment: FactoryGirl.attributes_for(:shipment) 
					}.to change(Shipment, :count).by (1)	
				end
			end
		end

		context "Business User is a premium user" do
			it "should allow user to create another job this month" do
					user = FactoryGirl.create(:business_user, account_type: 1)

					sign_in user

					shipment = FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					shipment = FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					shipment = FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					shipment = FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)
					shipment = FactoryGirl.create(:shipment, business_user_id: user.id, created_at: DateTime.now - 5.days)

					expect{
						post :create, shipment: FactoryGirl.attributes_for(:shipment) 
					}.to change(Shipment, :count).by (1)
				end
		end
	end
end
