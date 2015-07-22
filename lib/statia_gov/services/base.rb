module StatiaGov
  module Services
    class Base

      include Virtus.model
      include Services

      def call
        raise NotImplementedError
      end
    end
  end
end
