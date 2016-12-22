require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "user is signed in" do
    it "returns true" do
      sb = FactoryGirl.create(:business_user)
      sign_in sb

      expect(subject.send(:authenticate_any!)).to be true
    end
  end
end
