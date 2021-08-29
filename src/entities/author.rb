require_relative "entity"

class Author < Entity
  attr_reader :name, :biography

  def initialize(name, biography = nil)
    @name = name
    @biography = biography
    validate
  end

  def to_s
    @name
  end

  private

  def validate
    check_type(name, String)
    check_not_empty(name)
  end
end
