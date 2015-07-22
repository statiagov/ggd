class Facility < ActiveRecord::Base
  belongs_to :facility_type
  belongs_to :establishment

  has_many :inspections
end
