FactoryGirl.define do
  factory :establishment do
    sequence(:name) {|n| "Establishment #{n}"}
    sequence(:short_name) {|n| "SSS#{n}"}
  end
end