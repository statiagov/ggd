class InspectionTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  
  belongs_to :inspection, inverse_of: :inspection_transitions
end
