require_relative 'classes/item'

class Main
  def initialize
    @finished = false
  end

  def menu
    puts 'Please select an option:
    1 - List all books
    2 - List all music albums
    3 - List all games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - Exit'
    gets.chomp
  end

  def choose(choice)
    case choice.to_i
    # when 1
    # when 2
    # when 3
    # when 4
    # when 5
    # when 6
    # when 7
    # when 8
    # when 9
    when 10
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
