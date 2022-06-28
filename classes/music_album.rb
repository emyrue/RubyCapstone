require_relative 'item'

class MusicAlbum < Item
  def initialize(date,on_spotify)
    super(date)
    @on_spotify = on_spotify
  end

  def can_be_archived
    super && @on_spotify
  end

  def music_to_json
    { date: self.publish_date, on_spotify: @on_spotify }
  end
end
