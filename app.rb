require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'modules/attributes'
require_relative './classes/movie'
require_relative './classes/create_book'
require_relative './classes/create_game'
require_relative './classes/create_movie'
require_relative './classes/book'
require_relative './modules/store'
require 'json'

class App
  include Attributes
  include Store

  def initialize
    @books = load_books
    @music = []
    @movies = load_movies
    @games = load_games
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end

  def list_all_books
    puts(@books.map { |book| puts "Publisher: #{book[:publisher]}. Cover State: #{book[:cover_state]}" })
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "[#{index}] [Name: #{label.title}. Color: #{label.color}"
    end
  end

  def list_all_games
    puts(@games.map do |game|
           puts "Genre: #{game[:genre]}. Publish Date: #{game[:publish_date]}. Multiplayer: #{game[:multiplayer]}"
         end)
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "[#{index}] [Name: #{author.first_name} #{author.last_name}]"
    end
  end

  def add_book
    book_generator = BookGenerator.new
    object = add_item
    book = book_generator.create_book(object[:publish_date])
    @books << book.book_to_json
    store_books(@books.to_json)
  end

  def add_game
    game_generator = GameGenerator.new
    object = add_item
    game = game_generator.create_game(object[:publish_date])
    game.add_author(object[:author])
    game.add_label(object[:label])
    game.add_source(object[:source])
    game.add_genre(object[:genre])
    @games << game.game_to_json
    store_games(@games.to_json)
  end

  def list_all_movies
    puts(@movies.map { |movie| puts "is silent: #{movie[:silent]}" })
  end

  def list_all_sources
    @sources.each_with_index do |source, index|
      puts "[#{index}] [Name: #{source.name}]"
    end
  end

  def add_movie
    movie_generator = MovieGenerator.new
    object = add_item
    movie = movie_generator.create_movie(object[:publish_date])
    @movies << movie.movie_to_json
    store_movies(@movies.to_json)
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
