FactoryGirl.define do
  factory :facility_form, class: Forms::FacilityForm do
    location {FFaker::AddressNL.street_address}
    facility_type {FacilityType.take}
    establishment {Establishment.take}
  end
end
