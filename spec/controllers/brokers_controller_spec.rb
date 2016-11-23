require 'rails_helper'

RSpec.describe BrokersController, type: :controller do
  describe "#GET show" do
    it "renders the show page" do
      broker = FactoryGirl.create(:broker)

      get :show, id: broker.id

      expect(response).to render_template :show
    end
  end
end
