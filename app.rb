require_relative 'classes/music_album'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/label'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'modules/attributes'

class App
  include Attributes
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
    print 'When was this Item Published : '
    date = gets.chomp
    if item_type == '1'
      # Handle Music Albums Inputs
      print 'Can the Album be found using Spotify? [Y/N]: '
      on_spotify = gets.chomp=='Y' ||  gets.chomp=='y'
      [date, on_spotify]
    else
      print 'Not yet supported :)'
    end
  end

  def create_item(item_type)
    if item_type == '1'
      # Handle Music Albums Inputs
      dataInput = item_input(item_type)
      album = MusicAlbum.new(dataInput[0], dataInput[1])
      print "ID: #{album.id}\t\tGenre: #{album.genre.name} \t\t On Spotify: #{album.on_spotify} \t\t Pubished On : #{album.publish_date} "
      @music << album
      preserve_data('data/music.json', @music, 'music_album')
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

  def add_item
    puts 'When was this item published?'
    publish_date = gets.chomp
    author = item_author
    label = item_label
    source = item_source
    genre = item_genre
    { publish_date: publish_date, author: author, label: label, source: source, genre: genre }
  end

  def list_labels; end
end
