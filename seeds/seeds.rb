# frozen_string_literal: true

require_relative "../src/library"
require_relative "../src/main"

lib = Library.new("../storage.yml")

author = Author.new("Nazar")
author2 = Author.new("Курощуп", "Norm")
author3 = Author.new("Travis", "Travis Scott")
author4 = Author.new("Blago White", "KAIF")

lib.add(author)
lib.add(author2)
lib.add(author3)
lib.add(author4)

book = Book.new("Book Top 2", author)
book2 = Book.new("Book2", author2)
book3 = Book.new("Book Top 3", author3)
book4 = Book.new("Book4", author3)
book5 = Book.new("Book Top 1", author4)
book6 = Book.new("Book6", author4)
book7 = Book.new("Book7", author4)

lib.add(book)
lib.add(book2)
lib.add(book3)
lib.add(book4)
lib.add(book5)
lib.add(book6)
lib.add(book7)

reader = Reader.new("Top2", "otto@gmail.com", "NY", "Bolova", 42)
reader2 = Reader.new("Top(3)2", "fon@gmail.com", "CF", "Libera", 5)
reader3 = Reader.new("Top(3)3", "bismark@gmail.com", "WN", "Ikona", 3)
reader4 = Reader.new("Greta", "greta@gmail.com", "TX", "Meranu", 21)
reader5 = Reader.new("Top 1", "tunberg@gmail.com", "AL", "Befalo", 678)

lib.add(reader)
lib.add(reader2)
lib.add(reader3)
lib.add(reader4)
lib.add(reader5)

order = Order.new(book, reader5)
order2 = Order.new(book5, reader)
order3 = Order.new(book, reader)
order4 = Order.new(book, reader5)
order5 = Order.new(book3, reader)
order6 = Order.new(book3, reader5)
order7 = Order.new(book5, reader2)
order8 = Order.new(book5, reader3)
order9 = Order.new(book5, reader5)

lib.add(order)
lib.add(order2)
lib.add(order3)
lib.add(order4)
lib.add(order5)
lib.add(order6)
lib.add(order7)
lib.add(order8)
lib.add(order9)

lib.save("../storage.yml")
