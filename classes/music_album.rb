require_relative 'item'

class MusicAlbum < Item
  def initialize(date, on_spotify)
    super(date)
    @on_spotify = on_spotify
  end

  def can_be_archived
    super && @on_spotify
  end

  def music_to_hash
    { genre: @genre.name, publish_date: @publish_date, label: @label.title,
      author: "#{@author.first_name} #{@author.last_name}", source: @source.name, on_spotify: @on_spotify }
  end
end
