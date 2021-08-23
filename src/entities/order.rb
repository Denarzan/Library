require_relative "entity"

class Order < Entity
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
    validate
  end

  private

  def validate
    check_type(book, Book)
    check_type(reader, Reader)
    check_type(date, Date)
  end
end
