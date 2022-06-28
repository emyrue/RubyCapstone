require_relative 'movie'

class MovieGenerator
  def create_movie(date)
    puts 'Is this movie silent? y/n'
    silent = gets.chomp.to_s == 'y'
    puts 'Movie created successfully!'
    Movie.new(date, silent)
  end
end
