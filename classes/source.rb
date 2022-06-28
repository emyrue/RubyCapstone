require 'Securerandom'

class Source

    def initialize (name)
        @id = SecureRandom.uuid
        @name = name
        @items = []
    end
end
