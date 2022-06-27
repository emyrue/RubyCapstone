require_relative 'item'
require 'securerandom'

class MusicAlbum < Item
  def initialize(on_spotify)
    @on_spotify = on_spotify
    super()
  end

  def can_be_archived
    super() && @on_spotify
  end
end
