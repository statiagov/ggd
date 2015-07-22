class InspectionStateMachine
  include Statesman::Machine

  state :scheduled, initial:true
  state :completed
end
