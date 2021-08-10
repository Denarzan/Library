require 'yaml'

class Entity
  def check_type(var, type)
    unless var.is_a? type
      raise "Wrong type of #{var}"

    end
  end

  def check_not_empty(var)
    if var.size <= 0
      raise("#{var} is empty")
    end
  end

  def check_positive(var)
    unless var.positive?
      raise("The house number should be positive. Your input is #{var} ")
    end
  end

end


class Author < Entity
  def initialize(name, biography = nil)
    @name = name
    @biography = biography
    check_type(name, String)
    check_not_empty(name)
  end

  attr_reader :name, :biography

end


class Book < Entity
  def initialize(title, author)
    @title = title
    @author = author
    check_type(title, String)
    check_not_empty(title)
    check_type(author, Author)
  end

  attr_reader :title, :author

end


class Reader < Entity
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
    check_type(name, String)
    check_not_empty(name)
    check_type(email, String)
    check_not_empty(email)
    check_type(city, String)
    check_not_empty(city)
    check_type(street, String)
    check_not_empty(street)
    check_type(house, Integer)
    check_positive(house)
  end

  attr_reader :name, :email, :city, :street, :house

end


class Order < Entity
  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
    check_type(book, Book)
    check_type(reader, Reader)
    check_type(date, Date)
  end

  attr_reader :book, :reader, :date

end


class Library
  attr_reader :authors
  def initialize(file)
    @authors = []
    @books = []
    @readers = []
    @orders = []
    load(file)
  end

  def add(entity)
    case entity
    when Author
      @authors.push(entity)
    when Book
      @books.push(entity)
    when Reader
      @readers.push(entity)
    when Order
      @orders.push(entity)
    else
      raise("Your data doesn't belong to accessible entities. You can add only Author, Book, Reader or Order")
    end

  end

  def save(path_to_file)
    File.open(path_to_file, 'w') do |file|
      # YAML.dump(@authors, file)
      file.write(to_yaml)
      # puts "save #{@authors}"
    end
  end

  def top_readers(quantity=1) #TODO взять заказы и по них вычислить чьё имя чаще всего встречается. дефолт = 1
    @orders.each do |order|
      top_readers_arr = order.reader.each_with_object(Hash.new{ |h, k| h[k] = 0}) { |reader, h| h[reader] += 1}
      sorted_readers = top_readers_arr.sort_by{ |reader, count| -count }
      sorted_readers.keys[0..quantity]
    end
  end

  def top_books(quantity) #TODO взять заказы и по них вычислить какую книгу брали чаще всего. дефолт = 1
    @orders
  end

  def count_readers_of_top_books(quantity=3) #TODO из top_books взять топовые книги и у них посчитать читаталей дефолт3
    top_books(quantity)
  end

  private
  def load(file)
    begin
      # data = YAML.load_file(file) || []
      # puts data
      # @authors = data
      # puts "load #{@authors}"
      data = File.open(file, 'r') do |filename|
        test = YAML.load(filename)
        puts test
        puts test.authors.first.name
      end
    rescue Errno::ENOENT
      nil
    end

  end

end

author = Author.new("Nazar")
author2 = Author.new("Trololo", "Norm")
lib = Library.new('empty.yaml')
lib.add(author)
lib.add(author2)
lib.save('empty.yaml')
# puts lib.authors