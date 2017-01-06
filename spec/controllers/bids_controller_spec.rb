require 'rails_helper'

RSpec.describe BidsController, type: :controller do

  describe 'GET #new' do
    context "User is signed in" do
      it "Renders new template" do
        business_user = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_type: "BusinessUser", client_id: business_user.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        get :new, job_id: job.id

        expect(response).to render_template :new
      end
    end

    context "User is not signed in" do
      it "should redirect to the login page" do
        business_user = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_type: "BusinessUser", client_id: business_user.id)
        broker = FactoryGirl.create(:broker)

        get :new, job_id: job.id

        expect(response).to redirect_to root_path
      end
    end

    context "User is a bussiness_user" do
      it "should be redirect to dashboard with flash message" do
        business_user = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_type: "BusinessUser", client_id: business_user.id)

        sign_in business_user

        get :new, job_id: job.id

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
      end
    end

    context "User has already bidded on a job" do
      it "should redirect to dashboard with flash message" do
        business_user = FactoryGirl.create(:business_user)
        broker = FactoryGirl.create(:broker)
        job = FactoryGirl.create(:job, client_type: "BusinessUser", client_id: business_user.id)
        bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id, bidder_type: broker.class.name)

        sign_in broker
        

        get :new, job_id: job.id

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
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

  describe 'DELETE #destroy' do
    context "User is owner of bid" do
      it "deletes the bid" do
        sb  = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        bid = FactoryGirl.create(:bid, bidder_id: broker.id, bidder_type: broker.class.name)

        expect {
          delete :destroy, job_id: job.id, id: bid.id
        }.to change(Bid, :count).by (-1)
      end

      it "redirects to bids list for particular job" do
        sb  = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        bid = FactoryGirl.create(:bid, bidder_id: broker.id, bidder_type: broker.class.name)

        delete :destroy, job_id: job.id, id: bid.id

        expect(response).to redirect_to job_bids_path(job_id: job.id)
        expect(flash[:success]).to be_present
      end
    end

    context "user is not the owner" do
      it "does not deletes the bid" do
        sb  = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        bid = FactoryGirl.create(:bid, bidder_id: 23, bidder_type: broker.class.name)

        expect {
          delete :destroy, job_id: job.id, id: bid.id
        }.to change(Bid, :count).by (0)
      end

      it "redirects to dashboard" do
        sb  = FactoryGirl.create(:business_user)
        job = FactoryGirl.create(:job, client_id: sb.id)
        broker = FactoryGirl.create(:broker)

        sign_in broker
        bid = FactoryGirl.create(:bid, bidder_id: 23, bidder_type: broker.class.name)

        delete :destroy, job_id: job.id, id: bid.id

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
      end
    end
  end
end
