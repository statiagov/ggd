FactoryGirl.define do
  factory :facility_type do
    sequence(:name) {|n| "Type #{n}"}
    description {'Some random description'}
  end
end
