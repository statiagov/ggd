require 'ffaker'
#Seed data
falcility_type_list = ['Healthcare',
                       'Guesthouse',
                       'Hotel',
                       'School',
                       'Retail',
                       'Restaurant',
                       'Container',
                       'Food Storage',
                       'Bakery',
                       'Day Care'
]

inspections_type_list = %w(Announced Unannounced)

falcility_type_list.each do |name|
  FacilityType.create!(name:name, description: "Description of #{name}")
end

inspections_type_list.each do |name|
  InspectionType.create!(name:name, description: "Description of #{name}")
end


5.times do |i|
  Facility.create! location:FFaker::Address.street_address,
                   facility_type_id: (1..falcility_type_list.length).to_a.sample,
                   establishment: Establishment.create!(name:FFaker::Company.name, short_name:"SS%i"%i)
end

3.times do
  Inspection.create start_date:DateTime.now, inspection_type: InspectionType.take,facility:Facility.take


end


