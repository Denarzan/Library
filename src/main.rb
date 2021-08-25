require_relative "library"

def main
  lib = Library.new("../storage.yml")
  puts lib.top_readers(5)
  puts lib.top_books(3)
  puts lib.count_readers_of_top_books
end

main if $PROGRAM_NAME == __FILE__
