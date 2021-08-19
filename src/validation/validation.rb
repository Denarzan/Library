# frozen_string_literal: true

module Validate
  def check_type(*vars, type)
    raise 'Wrong type of variables' unless vars.each { |var| var.is_a? type }
  end

  def check_not_empty(*vars)
    raise('Some variable is empty') if vars.each.map(&:empty?).all?
  end

  def check_positive(var)
    raise('The house number should be positive.') unless var.positive?
  end
end
