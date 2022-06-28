class App
  def initialize
    @books = []
    @music = []
    @movies = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end

  def list_albums
      return puts "\n>>>> No Music  Albums available<<<" if @music.empty?
      puts
      @music.each { |album| puts "ID: #{album.id}\t\tGenre: #{album.genre.name} \t\t On Spotify: #{album.on_spotify} " }
      puts
  end 
end
