require_relative 'game'

class GameGenerator
  def create_game(date)
    puts 'Is this game multiplayer? (y/n)'
    multiplayer = gets.chomp.downcase
    while multiplayer != 'y' && multiplayer != 'n'
      puts 'Please enter a valid option: '
      multiplayer = gets.chomp.downcase
    end
    multiplayer = multiplayer == 'y'
    puts 'When was this game last played? (Format yyyy/mm/dd)'
    last_played_at = gets.chomp
    Game.new(date, multiplayer, last_played_at)
  end
end
