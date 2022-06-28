require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'modules/attributes'
require_relative './classes/create_book'
require_relative './classes/book'
require_relative 'store'
require 'json'

class App
  include Attributes
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
  
  def add_item
    puts 'When was this item published?'
    publish_date = gets.chomp
    author = item_author
    label = item_label
    source = item_source
    genre = item_genre
    { publish_date: publish_date, author: author, label: label, source: source, genre: genre }
  end

  def list_labels; end
end
