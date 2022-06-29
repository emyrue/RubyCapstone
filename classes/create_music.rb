require_relative 'music_album'

class MusicGenerator
  def create_music_album(date)
    print 'On Spotify [Y/N]:: '
    on_spotify = gets.chomp.to_s == 'Y' || gets.chomp.to_s == 'y'
    puts 'Music Album created successfully!'
    MusicAlbum.new(date, on_spotify)
  end
end
