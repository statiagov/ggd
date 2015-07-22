class Error

  extend ActiveModel::Naming

  def self.new(message)
    @errors = ActiveModel::Errors.new(self)
    @errors.add(:base, message)
    @errors
  end

  attr_reader :errors

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def Error.human_attribute_name(attr, options = {})
    attr
  end

  def Error.lookup_ancestors
    [self]
  end
end