require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe "#toggle_accept!" do
  	context "when bids have not been accepted" do
	  	it "updates the bid to not be accepted" do
	  		business_user = FactoryGirl.create(:business_user)
	  		job = FactoryGirl.create(:job, agent_id: nil, client_id: business_user.id)
	  		broker = FactoryGirl.create(:broker)
	  		bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id, accepted: true)

        bid.toggle_accept!(bid.accepted)

	  		expect(bid.accepted).to eq(false)
	  	end
    end

    context "when the bids have been accepted" do
    	it "updates the bid to be accepted" do
	  		business_user = FactoryGirl.create(:business_user)
	  		job = FactoryGirl.create(:job, agent_id: nil, client_id: business_user.id)
	  		broker = FactoryGirl.create(:broker)
	  		bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id, accepted: false)

	  		bid.toggle_accept!(bid.accepted)

	  		expect(bid.accepted).to eq(true)
    	end
    end
  end

  describe "#assign_agent!" do
    context "when bid is accepted" do
      it "assigns an agent" do
        business_user = FactoryGirl.create(:business_user)
        broker = FactoryGirl.create(:broker)
        job = FactoryGirl.create(:job, agent_id: nil, client_id: business_user.id)
        bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id, accepted: true)

        bid.assign_agent!
        job.reload

        expect(job.agent_id).to eq(broker.id)
      end
    end

    context "when bid is not accepted" do
      it "does not assign an agent" do
        business_user = FactoryGirl.create(:business_user)
        broker = FactoryGirl.create(:broker)
        job = FactoryGirl.create(:job, agent_id: nil, client_id: business_user.id)
        bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id, accepted: false)

        bid.assign_agent!
        job.reload

        expect(job.agent_id).to eq(nil)
      end
    end
  end
end
