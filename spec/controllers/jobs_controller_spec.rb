require 'rails_helper'

RSpec.describe JobsController, type: :controller do
	describe "GET #new" do
		context "User is a business user" do
			it "renders the new template" do
				user = FactoryGirl.create(:business_user)
				setup_shipment(user: user)

				sign_in user
				get :new, shipment_id: @shipment.id

				expect(response).to render_template :new
			end
		end

		context "User is not a business user" do
			it "redirects to root path" do
				broker = FactoryGirl.create(:broker)
				user = FactoryGirl.create(:business_user)
				setup_shipment(user: user)
				
				sign_in broker
				get :new, shipment_id: @shipment.id

				expect(response).to redirect_to root_path
			end
		end
	end

	describe "POST #create" do
		context "Business User is a free user" do
			context "User has made 5 jobs this month" do
				it "does not create a new job" do
					user = FactoryGirl.create(:business_user, account_type: 0)
					setup_shipment(user: user)
					setup_user_job_limit
					setup_jobs(user: user, shipment: @shipment, n: 5)

					sign_in user
					expect{
						post :create, shipment_id: @shipment.id, job: FactoryGirl.attributes_for(:job)
					}.to change(Job, :count).by(0)
				end
			end

			context "User has not made 5 jobs this month" do
				it "creates a new job" do
					user = FactoryGirl.create(:business_user, account_type: 0)
					setup_shipment(user: user)
					setup_user_job_limit
					setup_jobs(user: user, shipment: @shipment, n: 4)

					sign_in user
					expect{
						post :create, shipment_id: @shipment.id, job: FactoryGirl.attributes_for(:job)
					}.to change(Job, :count).by(1)
				end
			end
		end

		context "Business User is a premium user" do
			it "creates a new job" do 
				user = FactoryGirl.create(:business_user, account_type: 1)
				setup_shipment(user: user)
				setup_user_job_limit
				setup_jobs(user: user, shipment: @shipment, n: 5)

				sign_in user
				expect{
					post :create, shipment_id: @shipment.id, job: FactoryGirl.attributes_for(:job)
				}.to change(Job, :count).by(1)
			end
		end
	end
end

def setup_user_job_limit
	FactoryGirl.create(:user_limit, user_type: BusinessUser.class.name.underscore, limit_type: :job_post_limit, amount: 5)	
end

def setup_jobs(user:, shipment:, n:)
	n.times do 
		FactoryGirl.create(:job, client_id: user.id, client_type: user.class.name, shipment_id: shipment.id)
	end
end

def setup_shipment(user: )
	product = FactoryGirl.create(:product, business_user_id: user.id)
	shipment_product = FactoryGirl.create(:shipment_product, product_id: product.id)
	@shipment = FactoryGirl.create(:shipment, business_user_id: user.id, shipment_products: [shipment_product])
end