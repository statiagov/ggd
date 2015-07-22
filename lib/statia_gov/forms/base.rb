module StatiaGov
  module Forms
    class Base

        include Virtus.model
        include ::ActiveModel::Validations
        include ::ActiveModel::Conversion

        # Forms are never persisted on their own
        def persisted?
          false
        end

        # Define relationship methods
        def self.relations(*relations)
          relations.each do |relation|
            klass = relation.to_s.camelcase.constantize
            method = relation.to_s
            define_method "#{method}=" do |arg|
              begin
                arg.is_a?(klass) ? super(arg) : super(klass.find(arg))
              rescue ActiveRecord::RecordNotFound
                errors.add relation, "Couldn't find a record with id #{arg}"
              end
            end
          end
        end

        # Move clearing of messages to #clear_validators!
        def clear_validators!
          errors.clear
          super
        end

        # Overide #valid?  in order to stop the clearing of error messages
        def valid?(context = nil)
          current_context, self.validation_context = validation_context, context
          run_validations!
        ensure
          self.validation_context = current_context
        end
    end
  end
end