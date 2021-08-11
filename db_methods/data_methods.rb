# frozen_string_literal: true

module DBFunctions
  def load(file)
    File.open(file, 'r') do |filename|
      data = YAML.safe_load(filename)
      data.authors.each { |author| @authors.push(author) }
      data.books.each { |book| @books.push(book) }
      data.readers.each { |reader| @readers.push(reader) }
      data.orders.each { |order| @orders.push(order) }
    end
  rescue Errno::ENOENT
    nil
  end

  def save(path_to_file)
    File.open(path_to_file, 'w') do |file|
      file.write(to_yaml)
    end
  end

  def add(entity)
    case entity
    when Author then @authors.push(entity)
    when Book then @books.push(entity)
    when Reader then @readers.push(entity)
    when Order then @orders.push(entity)
    else
      raise("Your data doesn't belong to accessible entities. You can add only Author, Book, Reader or Order")
    end
  end
end
