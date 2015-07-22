module Forms
  class FacilityForm < StatiaGov::Forms::Base

    attribute :location, String
    attribute :facility_type, FacilityType
    attribute :establishment, Establishment

    validates :facility_type, presence: true
    validates :establishment, presence: true

    relations :facility_type, :establishment
  end
end
