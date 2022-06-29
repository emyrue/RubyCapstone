require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/source'

describe MusicAlbum do
  context 'When testing music album class' do
    before :each do
      @music_album = MusicAlbum.new('2022/06/28', true)
      @genre = Genre.new('Fiction')
      @author = Author.new('Isaac', 'Pitwa')
      @label = Label.new('Sony Music', 'Black')
      @source = Source.new('Spotify')
    end

    it 'Returns an instance of MusicAlbum' do
      expect(@music_album).to be_instance_of(MusicAlbum)
    end

    it 'Can be archived method works correctly' do
      expect(@music_album.can_be_archived?).to eq false
    end

    it 'Music to hash method works correctly' do
      @music_album.add_author(@author)
      @music_album.add_genre(@genre)
      @music_album.add_label(@label)
      @music_album.add_source(@source)
      hash = { genre: 'Fiction', publish_date: '2022/06/28', label: 'Sony Music', author: 'Isaac Pitwa',
               source: 'Spotify', on_spotify: true }
      expect(@music_album.music_to_hash).to eq hash
    end
  end
end
