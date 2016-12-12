require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  describe 'GET #new' do
    context "User is signed in" do
      it "Renders new template" do
        broker = FactoryGirl.create(:broker)

        sign_in broker
        get :new, job_id: 1

        expect(response).to render_template :new
      end
    end

    context "User is not signed in" do
      it "should redirect to the login page" do
        get :new, job_id: 1

        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST #create' do
    context "params are valid" do
      it "creates a bid" do
        sb = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker

        expect {
          post :create, bid: FactoryGirl.attributes_for(:bid, bidder_id: broker.id, job_id: job.id), job_id: job.id
        }.to change(Bid, :count).by (1)

      end

      it "renders to root path" do
        sb = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        post :create, bid: FactoryGirl.attributes_for(:bid, bidder_id: broker.id, job_id: job.id), job_id: job.id

        expect(response).to redirect_to root_path
      end
    end

    context "params are invalid" do
      it "does not creates the bid" do
        sb = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker

        expect {
          post :create, bid: FactoryGirl.attributes_for(:bid, price: nil, bidder_id: broker.id, job_id: job.id), job_id: job.id
        }.to change(Bid, :count).by (0)
      end

      it "renders the new template" do
        sb = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        post :create, bid: FactoryGirl.attributes_for(:bid, price: nil, bidder_id: broker.id, job_id: job.id), job_id: job.id

        expect(response).to render_template :new
      end
    end
  end
end
