# frozen_string_literal: true

require 'date'
require_relative '../validation/validation'
class Entity
  include Validate
end

class Author < Entity
  attr_reader :name, :biography

  def initialize(name, biography = nil)
    @name = name
    @biography = biography
    super()
    validate
  end

  private

  def validate
    check_type(name, String)
    check_not_empty(name)
  end
end

class Book < Entity
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    super()
    validate
  end

  private

  def validate
    check_type(title, String)
    check_not_empty(title)
    check_type(author, Author)
  end
end

class Reader < Entity
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    super()
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

class Order < Entity
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
    super()
    validate
  end

  private

  def validate
    check_type(book, Book)
    check_type(reader, Reader)
    check_type(date, Date)
  end
end
