require_relative './classes/create_book'
require_relative './classes/create_book'
class App
  def initialize
    @books = []
    @music = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end



  def add_book
    book_generator = BookGenerator.new
    book = book_generator.create_book
    @books << book.book_to_json
  end


end
