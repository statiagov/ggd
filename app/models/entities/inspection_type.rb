class InspectionType < ActiveRecord::Base
  validates_presence_of :name
  has_one :inspection
end
