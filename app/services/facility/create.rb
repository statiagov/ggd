module Services
  module Facility
    class Create < StatiaGov::Services::Base

      attribute :facility_form

      def call
        if facility_form.valid?
          process!
        else
         Result::Failure.new(errors:facility_form.errors)
        end
      end

      protected

        # wrap the creation of a facility in a transaction
        def create_facility
          ActiveRecord::Base.transaction do
            ::Facility.create(
                location:facility_form.location,
                facility_type:facility_form.facility_type,
                establishment:facility_form.establishment
            )
          end
        end

        # process the creation of a facility
        def process!
          begin
            Result::Success.new(facility:create_facility)
          rescue ActiveRecord::RecordInvalid, ActiveRecord::InvalidForeignKey
            Result::Failure.new(errors:Error.new("The record was invalid and couldn't be save"))
          end
        end
    end
  end
end