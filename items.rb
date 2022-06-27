require 'securerandom'

class Items
    attr_accessor :publish_date
    attr_reader :genre, :author, :label, :source
    def initialize(genre, author, source, label, date)
        @id = SecureRandom.uuid
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = date
        @archived = false
    end
end
