require_relative 'classes/music_album'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'modules/attributes'
require_relative './classes/create_book'
require_relative './classes/create_music'
require_relative './classes/book'
require_relative './modules/store'
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

  def list_all_albums
      return puts "\n>>>> No Music  Albums available<<<" if @music.empty?
      puts
      @music.each_with_index  do |album, index|
        puts "On Spotify: #{album[:on_spotify]} \t\t Pubished On : #{album[:publish_date]} " 
      end
  end 

  def list_all_genres
    return puts "\n>>>> No Genres  available<<<" if @genres.empty?
    puts
    @genres.each_with_index  do |genre, index|
       puts "[#{index}] Genre: #{genre.name}" 
    end
end 
  def list_all_books
    puts(@books.map { |book| puts "Publisher: #{book[:publisher]}. Cover State: #{book[:cover_state]}" })
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "[#{index}] [Name: #{label.title}. Color: #{label.color}"
    end
  end


  def add_book
    book_generator = BookGenerator.new
    object = add_item
    book = book_generator.create_book(object[:publish_date])
    @books << book.book_to_json
    store_books(@books.to_json)
  end


  def add_music_album
    music_generator = MusicGenerator.new
    object = add_item
    music = music_generator.create_music_album(object[:publish_date])
    @music << music.music_to_json
    store_music(@music.to_json)
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
end
