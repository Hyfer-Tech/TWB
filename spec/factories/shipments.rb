FactoryGirl.define do
  factory :shipment do
	 approval true
	 shipment_confirmed true
   association :business_user, factory: :business_user	 
  end
end