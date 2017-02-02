require 'rails_helper'

RSpec.describe AuditRequestsController, type: :controller do
  describe "GET #index" do
    it "returns 200" do
      business_user = FactoryGirl.create(:business_user)
      audit = FactoryGirl.create(:audit, business_user_id: business_user.id)

      sign_in business_user
      get :index, params: { audit_id: audit.id }

      expect(response.status).to be(200)
    end
  end

  describe "POST #create" do
    it "should redirect to audits_path" do
      broker = FactoryGirl.create(:broker)
      business_user = FactoryGirl.create(:business_user)
      audit = FactoryGirl.create(:audit, business_user_id: business_user.id)

      sign_in broker
      post :create, params: { audit_id: audit.id }

      expect(response).to redirect_to audits_path
    end

    context "when attributes are valid" do
      it "creates a new audit" do
        broker = FactoryGirl.create(:broker)
        business_user = FactoryGirl.create(:business_user)
        audit = FactoryGirl.create(:audit, business_user_id: business_user.id)

        sign_in broker
        
        expect {
          post :create, params: { audit_id: audit.id }
        }.to change(AuditRequest, :count).by(1)
      end
    end    
  end
end
