FactoryGirl.define do
  factory :job do
    job_type "broker"
    shipment_id 1
    client_id 1
    agent_id 11
    client_type "Business User"
    agent_type "Broker User"
    date_of_shipment DateTime.now
    location_of_shipment "US"
    place_being_shipped_to "Canada"
    border_expected_to_cross "US"
  end
end