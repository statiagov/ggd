module Forms
  module Inspection
    class Scheduler < StatiaGov::Forms::Base

      attribute :date, Time
      attribute :facility, Facility
      attribute :inspection_type, InspectionType

      validates :facility, presence: true
      validates :inspection_type, presence: true
      validates :date, presence: true

      relations :inspection_type, :facility
    end
  end
end





