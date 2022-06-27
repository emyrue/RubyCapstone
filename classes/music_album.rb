require_relative 'item'

class MusicAlbum < Item
  def initialize(on_spotify)
    @on_spotify = on_spotify
    super()
  end

  def can_be_archived
    super() && @on_spotify
  end
end
