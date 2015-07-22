class FacilityType < ActiveRecord::Base
  has_one :facility

  validates_uniqueness_of :name
  validates_presence_of   :name
end
