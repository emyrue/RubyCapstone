require_relative 'movie'

class MovieGenerator
    def create_movie(date)
        puts 'Is this movie silent?'
        silent = gets.chomp == 'y' ? true : false
        movie = Movie.new(date, silent)
        puts 'Movie created successfully!'
    end
end
