require_relative 'classes/item'
require_relative 'app'

class Main
  def initialize
    @finished = false
    @app = App.new
  end

  def menu
    puts 'Please select an option:
    1 - List all books
    2 - List all music albums
    3 - List all movies
    4 - List all games
    5 - List all genres
    6 - List all labels
    7 - List all authors
    8 - List all sources
    9 - Add a book
    10 - Add a music album
    11 - Add a movie
    12 - Add a game
    13 - Exit'
    gets.chomp
  end

  def choose(choice) # rubocop:disable Metrics/CyclomaticComplexity
    case choice.to_i
    # when 1
    when 1
      @app.list_all_books
<<<<<<< HEAD
    when 2
      @app.list_all_albums
    # when 3
=======
    # when 2
    when 3
      @app.list_all_movies
>>>>>>> 6dfb28f9a107f1b2fe48621ad3ed3ff0f350dc75
    # when 4
    # when 5
    when 6
      @app.list_all_labels
    # when 7
    when 8
      @app.list_all_sources
    when 9
      @app.add_book
    when 10
      @app.add_music_album
    # when 10
    when 11
      @app.add_movie
    # when 12
    when 13
      @finished = true
    else
      puts 'Please enter a valid option.'
    end
  end

  def run
    until @finished
      choice = menu
      choose(choice)
    end
  end
end

Main.new.run
