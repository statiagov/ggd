module StatiaGov
  module Services
    extend ActiveSupport::Concern

    included do
      def self.call(*args)
        new(*args).call
      end
    end
  end
end

require_relative 'services/base'

require_relative 'services/result/failure'
require_relative 'services/result/success'