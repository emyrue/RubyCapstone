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

  def item_input(item_type)
    print 'What Date was it Published : '
    date = gets.chomp
    if item_type == '1'
      # Handle Music Albums Inputs
      print 'Can the Album be found using Spotify? [Y/N]: '
      on_spotify = on_spotify?
      [date, on_spotify]
    else
      print 'Not yet supported :)'
    end
  end

  def create_item(item_type)
    if item_type == '1'
      # Handle Music Albums Inputs
      date, on_spotify = item_input(item_type)
      album = MusicAlbum.new(date, on_spotify)
      @music << album
      preserve_data(@person_path, @person, 'persons')
      puts "\n> Album created successfully\n\n"
    else
      print 'Not yet supported :)'
    end
  end


  def list_albums
      return puts "\n>>>> No Music  Albums available<<<" if @music.empty?
      puts
      @music.each { |album| puts "ID: #{album.id}\t\tGenre: #{album.genre.name} \t\t On Spotify: #{album.on_spotify} \t\t Pubished On : #{album.publish_date} " }
      puts
  end 


  def list_genres
    return puts "\n>>>> No Genres  available<<<" if @genres.empty?
    puts
    @genres.each { |genre| puts "ID: #{genre.id}\t\tGenre: #{genre.name} " }
    puts
end 

end
