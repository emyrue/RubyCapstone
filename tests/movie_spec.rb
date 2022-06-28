require_relative '../classes/movie'
require_relative '../classes/genre'
require_relative '../classes/author'

describe Movie do
    context 'When testing movie class' do
        before :each do
            @movie = Movie.new('2022/06/28', true)
            @genre = Genre.new('Fiction')
            @author = Author.new('Juan', 'Sotomayor')
        end

        it 'Returns an instance of Movie' do
            expect(@movie).to be_instance_of(Movie)
        end

        it 'Can be archived method works correctly' do
            expect(@movie.can_be_archived?).to eq true
        end

        it 'Movie to hash method works correctly' do
            hash = {silent: true, first_name: 'Juan', last_name: 'Sotomayor', genre: 'Fiction'}
            @movie.add_author(@author)
            @movie.add_genre(@genre)
            expect(@movie.movie_to_hash).to eq hash
        end
    end
end