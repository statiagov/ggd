class Inspection < ActiveRecord::Base
  class RetrieveAvailability
    include Virtus.model
    include Service

    attribute :month, Integer, default: Date.today.month
    attribute :year,  Integer, default: Date.today.year

    def call

    end
  end
end