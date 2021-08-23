require_relative("errors")

module Validate
  include Errors

  def check_type(*vars, type)
    vars.each { |var| raise TypeError unless var.is_a? type }
  end

  def check_not_empty(*vars)
    vars.each { |var| raise EmptyError if var.strip.empty? }
  end

  def check_positive(var)
    raise SignError unless var.positive?
  end
end
