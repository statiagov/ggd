FactoryGirl.define do
  factory :facility do
    sequence(:location)       {|n|  "Location #{n}"}
    facility_type
    establishment
  end
end
