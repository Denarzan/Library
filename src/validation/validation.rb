require_relative("errors")

module Validate
  include Errors

  def check_type(*vars, type)
    raise TypeError unless vars.each { |var| var.is_a? type }
  end

  def check_not_empty(*vars)
    raise EmptyError if vars.each.map(&:empty?).all?
  end

  def check_positive(var)
    raise SignError unless var.positive?
  end
end
