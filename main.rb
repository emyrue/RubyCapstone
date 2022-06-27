require_relative 'item'
require_relative 'select'

class Main
  def initialize
    @selection = Select.new
  end

  def menu
    puts 'Please select an option: \n
    1 - List all books \n
    2 - List all music albums \n
    3 - List all games \n
    4 - List all genres \n
    5 - List all labels \n
    6 - List all authors \n
    7 - Add a book \n
    8 - Add a music album \n
    9 - Add a game
    10 - Exit'
    user_input = gets.chomp
    until 
  end
end
