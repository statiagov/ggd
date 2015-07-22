class Inspection < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :inspection_type
  belongs_to :facility
  has_many   :inspection_transitions, class_name: "InspectionTransition"

  sortable by: ["start_date DESC"], default: "start_date DESC"
  has_ransackable_associations %w(facility)
  ransack_can_autocomplete

  scope :text_search, ->(query) { search('name_cont' => query).result }


  def self.search(params={})
    byebug
  end

  def self.per_page
    20
  end

  def state_machine
    @state_machine ||= InspectionStateMachine.new(self,transition_class:InspectionTransition)
  end

  def self.transition_class
    InspectionTransition
  end

  def self.initial_state
    :scheduled
  end

  # @return date range
  def date_range
    start_date..end_date
  end

  def inspection_number
    name = facility.establishment.short_name.upcase
    hex =  id.to_s(16)
    "INSP-#{name}-#{hex}"
  end
end
