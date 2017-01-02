FactoryGirl.define do
  factory :bid do
    bidder_id 1
    job_id 1
    accepted false
    bidder_type "Broker"
    cover_letter "some random text"
    price "10.00"
  end
end