require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  describe "#POST create" do
    it "creates a new relationship" do
      user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)
      allow(user).to receive(:follow).with(broker)

      sign_in user
      post :create, params: { relationship: {user_type: broker.class.name, user_id: broker.id} }

      expect(user).to have_received(:follow)
    end
  end

  describe "#DELETE destroy" do
    it "deletes the relationship" do
      user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)
      allow(user).to receive(:stop_following).with(broker)

      sign_in user
      delete :destroy, params: { relationship: {user_type: broker.class.name, user_id: broker.id} }

      expect(user).to have_received(:stop_following)
    end
  end
end
