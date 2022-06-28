require_relative './classes/create_book'
require_relative './classes/book'
require_relative 'store'
require 'json'

class App
  include Store
  def initialize
    @books = load_books
    @music = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []

  end

  def list_all_books
    puts(@books.map { |book| puts "Publisher: #{book[:publisher]}. Cover State: #{book[:cover_state]}" })
  end

  def list_all_labels
    puts(@labels.map { |label| puts "Name: #{label[:title]}. Color: #{label[:color]}" })
  end

  def add_book
    book_generator = BookGenerator.new
    book = book_generator.create_book
    @books << book.book_to_json
    store_books(@books.to_json)
  end
  
end
