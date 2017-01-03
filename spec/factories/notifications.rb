FactoryGirl.define do
  factory :notification do
    recipient_id 1
    actor_id 1
    read_at "2017-01-01 09:23:04"
    action "MyString"
    notifiable_id 1
    notifiable_type "MyString"
  end
end
