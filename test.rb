require 'yaml'

file = YAML.load(File.read("storage.yaml"))
read_authors = file[:authors]
read_authors.each {|el| el.each { |author, bio| puts "#{author}, #{bio}" } }