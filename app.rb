require_relative 'classes/music_album'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'modules/attributes'
require_relative './classes/movie'
require_relative './classes/create_book'
require_relative './classes/create_music'
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
    @music = load_music
    @genres = load_genres
    @labels = load_labels
    @authors = load_authors
    @sources = load_sources
    @movies = load_movies
    @games = load_games
  end

  def list_all_albums
    return puts "\n>>>> No Music  Albums available<<<" if @music.empty?

    puts
    @music.each_with_index do |album, index|
      puts "[#{index}]- Genre: #{album[:genre]} Label: #{album[:label]}. Author: #{album[:author]}. Source: #{album[:source]}. On Spotify: #{album[:on_spotify]} .  Publish Date: #{album[:publish_date]}." # rubocop:disable Layout/LineLength
    end
  end

  def list_all_genres
    return puts "\n>>>> No Genres  available<<<" if @genres.empty?

    puts
    @genres.each_with_index do |genre, index|
      puts "[#{index}] Genre: #{genre[:name]}"
    end
  end

  def list_all_books
    puts(@books.map { |book| puts "Publisher: #{book[:publisher]}. Cover State: #{book[:cover_state]}" })
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "[#{index}] [Name: #{label[:title]} Color: #{label[:color]}"
    end
  end

  def list_all_games
    @games = load_games
    puts(@games.map do |game|
           puts "Genre: #{game[:genre]}. Publish Date: #{game[:publish_date]}. Multiplayer: #{game[:multiplayer]}"
         end)
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "[#{index}] [Name: #{author[:first_name]} #{author[:last_name]}]"
    end
  end

  def add_book
    book_generator = BookGenerator.new
    object = add_item
    book = book_generator.create_book(object[:publish_date])
    @books << book.book_to_hash
    store_books(@books.to_json)
  end

  def add_music_album
    music_generator = MusicGenerator.new
    object = add_item
    music = music_generator.create_music_album(object[:publish_date])
    music.add_label(object[:label])
    music.add_author(object[:author])
    music.add_source(object[:source])
    music.add_genre(object[:genre])

    @music << music.music_to_hash
    store_music(@music.to_json)
  end

  def add_game
    game_generator = GameGenerator.new
    object = add_item
    puts object.inspect
    game = game_generator.create_game(object[:publish_date])
    game.add_author(object[:author])
    game.add_label(object[:label])
    game.add_source(object[:source])
    game.add_genre(object[:genre])
    @games << game.game_to_hash
    store_games(@games.to_json)
    puts 'Game created successfully'
  end

  def list_all_movies
    puts(@movies.map do |movie|
           puts "Author: #{movie[:first_name]} #{movie[:last_name]} Genre: #{movie[:genre]} silent?: #{movie[:silent]}"
         end)
  end

  def list_all_sources
    @sources.each_with_index do |source, index|
      puts "[#{index}] [Name: #{source[:name]}]"
    end
  end

  def add_movie
    movie_generator = MovieGenerator.new
    object = add_item
    movie = movie_generator.create_movie(object[:publish_date])
    movie.add_author(object[:author])
    movie.add_label(object[:label])
    movie.add_source(object[:source])
    movie.add_genre(object[:genre])
    @movies << movie.movie_to_hash
    store_movies(@movies.to_json)
  end

  def add_item
    puts 'When was this item published? (Format yyyy/mm/dd)'
    publish_date = gets.chomp
    author = item_author
    label = item_label
    source = item_source
    genre = item_genre
    { publish_date: publish_date, author: author, label: label, source: source, genre: genre }
  end
end
