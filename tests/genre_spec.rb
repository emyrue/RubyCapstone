require_relative '../classes/genre'

describe Genre do
  context 'When Testing Genre class' do
    before :each do
      @genre = Genre.new('Fantasy')
      @book = Book.new('2022/06/28', 'Juan.inc', 'Good')
    end

    it 'Returns instance of Genre' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'Has correct name' do
      expect(@genre.name).to eq 'Fantasy'
    end

    it 'Item adds itself to genre.items array' do
      @book.add_genre(@genre)
      expect(@genre.items).not_to be_empty
    end

    it 'Returns correct hash' do
      hash = { name: 'Fantasy' }
      expect(@genre.genre_to_hash).to eq hash
    end
  end
end
