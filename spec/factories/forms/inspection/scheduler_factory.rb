FactoryGirl.define do
  factory :scheduler_form, class:Forms::Inspection::Scheduler do
    facility {Facility.take}
    inspection_type {InspectionType.take}
    date {DateTime.now.change(hour:9,min:30)}
  end
end
