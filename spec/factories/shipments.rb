FactoryGirl.define do
  factory :shipment do
   title "Shipment Title"
	 approval true
	 shipment_confirmed true
   association :business_user, factory: :business_user
  end
end
