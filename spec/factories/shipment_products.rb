FactoryGirl.define do
  factory :shipment_product do
    quantity 1
    association :product, factory: :product    
  end
end
