require_relative 'item'

class Book < Item
    def initialize(publisher, cover_state)
        super()
        @publisher = publisher
        @cober_state = cover_state
    end

    
end