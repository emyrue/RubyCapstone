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

  def add_item
    puts "When was this item published?"
    publish_date = gets.chomp
    author = item_author
    label = item_label
    source = item_source
    genre = item_genre
    return {publish_date: publish_date, author: author, label: label, source: source, genre: genre}
  end

  def list_labels

  end
end
