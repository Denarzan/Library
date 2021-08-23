require_relative 'entity'

class Reader < Entity
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate
  end

  private

  def validate
    check_type(name, email, city, street, String)
    check_not_empty(name, email, city, street)
    check_type(house, Integer)
    check_positive(house)
  end
end
