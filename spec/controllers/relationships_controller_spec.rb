require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  describe "#POST create" do
    it "creates a new relationship" do
      business_user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)
      controller.stub(:current_business_user).and_return(business_user)
      allow(business_user).to receive(:follow).with(broker)

      sign_in business_user
      post :create, params: { relationship: {user_type: broker.class.name, user_id: broker.id} }

      expect(business_user).to have_received(:follow)
    end
  end

  describe "#DELETE destroy" do
    it "deletes the relationship" do
      business_user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)
      controller.stub(:current_business_user).and_return(business_user)
      allow(business_user).to receive(:stop_following).with(broker)      

      sign_in business_user
      delete :destroy, params: { relationship: {user_type: broker.class.name, user_id: broker.id} }

      expect(business_user).to have_received(:stop_following)
    end
  end
end
