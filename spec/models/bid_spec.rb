require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe "toggle accept!" do
  	context "when bids have not been accepted" do
	  	it "updates the bid to not be accepted" do
	  		business_user = FactoryGirl.create(:business_user)
	  		job = FactoryGirl.create(:job, agent_id: nil)
	  		broker = FactoryGirl.create(:broker)
	  		bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id)

	  		expect(bid.accepted).to eq(false)
	  		expect(bid.job.agent_id).to eq(nil)
	  	end
    end

    context "when the bids have been accepted" do
    	it "updates the bid to be accepted" do
	  		business_user = FactoryGirl.create(:business_user)
	  		job = FactoryGirl.create(:job, agent_id: nil)
	  		broker = FactoryGirl.create(:broker)
	  		bid = FactoryGirl.create(:bid, job_id: job.id, bidder_id: broker.id)

	  		bid.toggle_accept!(bid)

	  		expect(bid.accepted).to eq(true)
	  		expect(bid.job.agent_id).to eq(broker.id)
    	end
    end
  end
end
