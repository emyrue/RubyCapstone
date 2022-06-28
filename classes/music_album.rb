require_relative 'item'

class MusicAlbum < Item
  def initialize(date,on_spotify)
    @on_spotify = on_spotify
    super(date)
  end

  def can_be_archived
    super && @on_spotify
  end

  def to_json
    { date: @publish_date, on_spotify: @on_spotify }
  end
end
