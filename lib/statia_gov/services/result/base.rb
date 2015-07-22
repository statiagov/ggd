require 'statia_gov/simple_dto'
require 'statia_gov/services/result/base/predicate_methods_for_inheritance'

module StatiaGov
  module Services
    module Result
      class Base < ::StatiaGov::SimpleDto
        extend PredicateMethodsForInheritance
      end
    end
  end
end

