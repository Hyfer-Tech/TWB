FactoryGirl.define do
  factory :shipment do
	 broker_id "1"
	 forward_freight_id "2"
	 approval true
	 shipment_confirmed true
	 business_user_id "3"   
  end
end