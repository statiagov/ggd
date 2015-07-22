module Services
  module Inspection
    class Schedule < StatiaGov::Services::Base

      attribute :scheduler_form

      def call
        if scheduler_form.valid?
          process!
        else
          Result::Failure.new(errors:scheduler_form.errors)
        end
      end

      private

      # wrap the creation of an inspection in a transaction
      def schedule_inspection
        ActiveRecord::Base.transaction do
          ::Inspection.create(
              start_date:scheduler_form.date,
              facility:scheduler_form.facility,
              inspection_type:scheduler_form.inspection_type
          )
        end
      end

      # process the scheduling of an inspection
      def process!
        begin
          Result::Success.new(inspection:schedule_inspection)
        rescue ActiveRecord::RecordInvalid, ActiveRecord::InvalidForeignKey
          Result::Failure.new(errors:Error.new("The record was invalid and couldn't be save"))
        end
      end
    end
  end
end