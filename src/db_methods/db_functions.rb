require_relative "../validation/errors"

module DBFunctions
  def load_file(file)
    return nil if File.zero?(file)

    save_data(file)
  rescue Errno::ENOENT
    nil
  end

  def save(path_to_file)
    File.open(path_to_file, "w") do |file|
      file.write(to_yaml)
    end
  end

  def save_data(file)
    File.open(file, "r") do |filename|
      data = YAML.load(filename)
      data.authors.each { |author| @authors.push(author) }
      data.books.each { |book| @books.push(book) }
      data.readers.each { |reader| @readers.push(reader) }
      data.orders.each { |order| @orders.push(order) }
    end
  end

  def add(entity)
    case entity
    when Author then @authors.push(entity)
    when Book then @books.push(entity)
    when Reader then @readers.push(entity)
    when Order then @orders.push(entity)
    else
      raise Errors::ClassError
    end
  end
end
