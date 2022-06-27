require_relative 'classes/item'
class MusicAlbum < Item
    def initialize(on_spotify,cover_state)
        @on_spotify = on_spotify
        @cover_state = cover_state
        super()
    end

    def can_be_archived
        super() && @on_spotify
    end
end