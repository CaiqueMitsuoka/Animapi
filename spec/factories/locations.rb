FactoryGirl.define do
  factory :location do
    sequence(:lat, 15589) { |n| n / 1000.0 }
    sequence(:lgt, 15589) { |n| n / 1000.0 }
  end
end
