require 'rails_helper'

RSpec.describe ForwardFreightsController, type: :controller do
  describe "#GET show" do
    it "renders the show page" do
      forward_freight = FactoryGirl.create(:forward_freight)

      sign_in forward_freight
      get :show, id: forward_freight.id

      expect(response).to render_template :show
    end
  end
end
