# frozen_string_literal: true

require_relative '../src/library'

lib = Library.new('../storage.yml')

author = Author.new('Nazar')
author2 = Author.new('Trololo', 'Norm')

lib.add(author)
lib.add(author2)

book = Book.new('Book1', author)
book2 = Book.new('Book2', author2)

lib.add(book)
lib.add(book2)

reader = Reader.new('Otto', 'otto@gmail.com', 'NY', 'Bolova', 42)
reader2 = Reader.new('Fon', 'fon@gmail.com', 'CF', 'Libera', 5)
reader3 = Reader.new('Bismark', 'bismark@gmail.com', 'WN', 'Ikona', 3)
reader4 = Reader.new('Greta', 'greta@gmail.com', 'TX', 'Meranu', 21)
reader5 = Reader.new('Tunberg', 'tunberg@gmail.com', 'AL', 'Befalo', 678)

lib.add(reader)
lib.add(reader2)
lib.add(reader3)
lib.add(reader4)
lib.add(reader5)

order = Order.new(book, reader)
order2 = Order.new(book2, reader)
order3 = Order.new(book, reader2)
order4 = Order.new(book, reader3)
order5 = Order.new(book, reader5)

lib.add(order)
lib.add(order2)
lib.add(order3)
lib.add(order4)
lib.add(order5)

lib.top_readers(3)
lib.top_books(3)
lib.count_readers_of_top_books
lib.save('../storage.yml')
