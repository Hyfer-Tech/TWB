require 'spec_helper'

describe UserDecorator do
  describe "#name" do
    it "returns full name" do
      user = FactoryGirl.create(:forward_freight, first_name: "Mark", last_name: "Zuckerburg")      

      expect(user.decorate.name).to eq("Mark Zuckerburg")
    end
  end

  describe "#original" do
    it "returns the original object" do
      user = FactoryGirl.create(:forward_freight, first_name: "Mark", last_name: "Zuckerburg")      

      expect(user.decorate.original).to eq(user)
    end
  end

  describe "#edit_link" do
    it "returns correct path to edit page" do
      ff = FactoryGirl.create(:forward_freight)
      business_user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)

      expect(ff.decorate.edit_link).to eq("/forward_freights/edit")
      expect(business_user.decorate.edit_link).to eq("/business_users/edit")
      expect(broker.decorate.edit_link).to eq("/brokers/edit")
    end
  end

  describe "#edit_link" do
    it "returns correct path to edit page" do
      ff = FactoryGirl.create(:forward_freight)
      business_user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)

      expect(ff.decorate.profile_link).to eq("/forward_freights/#{ff.id}")
      expect(business_user.decorate.profile_link).to eq("/business_users/#{business_user.id}")
      expect(broker.decorate.profile_link).to eq("/brokers/#{broker.id}")
    end
  end

  describe "#user_type" do
    it "returns the correct type for the user" do
      ff = FactoryGirl.create(:forward_freight)
      business_user = FactoryGirl.create(:business_user)
      broker = FactoryGirl.create(:broker)

      expect(ff.decorate.user_type).to eq(ff.class)
      expect(business_user.decorate.user_type).to eq(business_user.class)
      expect(broker.decorate.user_type).to eq(broker.class)
    end
  end

  describe "#address" do
    context "address line 2 does not exist" do
      it "only returns the first line" do
        user = FactoryGirl.create(:forward_freight, address_line_1: "Address 1", address_line_2: nil)      

        expect(user.decorate.address).to eq("Address 1")
      end
    end

    context "address line 2 exists and line 3 does not exist" do
      it "returns the address until line 2" do
        user = FactoryGirl.create(:forward_freight, address_line_1: "Address 1", address_line_2: "Address 2", address_line_3: nil)      

        expect(user.decorate.address).to eq("Address 1, Address 2")
      end
    end

    context "address line 3 exists" do
      it "returns the full address" do
        user = FactoryGirl.create(:forward_freight, address_line_1: "Address 1", address_line_2: "Address 2", address_line_3: "Address 3")      

        expect(user.decorate.address).to eq("Address 1, Address 2, Address 3")
      end
    end
  end
end
