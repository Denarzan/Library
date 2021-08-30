require_relative "library"
require_relative "../seeds/seeds" unless File.file?("../storage.yml")

def main
  lib = Library.new("../storage.yml")
  puts "Most Popular Readers"
  puts lib.top_readers(2)
  puts "\n/-/-/-/-/-/-/-/-/-/-/-/-/-/-/\n\n"
  puts "Most Popular Books"
  puts lib.top_books(3)
  puts "\n/-/-/-/-/-/-/-/-/-/-/-/-/-/-/\n\n"
  puts "Number of Readers of the Most Popular Books: "
  puts lib.count_readers_of_top_books
end

main if $PROGRAM_NAME == __FILE__
