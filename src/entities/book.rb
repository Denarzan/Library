require_relative 'entity'

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
