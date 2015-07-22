module StatiaGov
  class SimpleDto
    attr_reader :_data

    def initialize(data = {})
      @_data = data
      handle_error
      define_accessors
    end

    def errors
      @errors ||= {}
    end

    private

    def handle_error
      _data.each_pair do |key, value|
        if key.to_s == 'errors'
          @errors = value
        end
      end
    end

    def define_accessors
      self.class.class_exec(_data) do |_data|
        _data.each_key do |key|
          next if key.to_s == 'errors'
          next if instance_methods(false).include?(key.to_sym)

          define_method key do
            @_data[key]
          end
        end
      end
    end
  end
end
