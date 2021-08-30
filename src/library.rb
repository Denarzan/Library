# frozen_string_literal: true

require "yaml"
require "date"
require_relative "entities/entity"
require_relative "entities/author"
require_relative "entities/book"
require_relative "entities/reader"
require_relative "entities/order"
require_relative "db_methods/db_functions"

class Library
  include DBFunctions

  attr_reader :authors, :books, :readers, :orders

  def initialize(file)
    @authors = []
    @books = []
    @readers = []
    @orders = []
    load_file(file)
  end

  def top_readers(quantity = 1)
    top_readers_arr = @orders.uniq.group_by(&:reader).map { |key, value| [key, value.count] }
    top_readers_arr.sort_by! { |_, orders| -orders }
    top_readers_arr[0...quantity].map { |reader, _count| reader }
  end

  def top_books(quantity = 1)
    top_books_arr = @orders.uniq.group_by(&:book).map { |key, value| [key, value.count] }
    top_books_arr.sort_by! { |_, orders| -orders }
    top_books_arr[0...quantity].map { |book, _count| book }
  end

  def count_readers_of_top_books(quantity = 3)
    top_books_arr = @orders.group_by(&:book).map { |key, value| [key, value.count] }
    top_books_arr.sort_by! { |_, orders| -orders }
    top_books_arr[0...quantity].map { |_book, count| count }
  end
end
