require 'securerandom'

class Genre
  attr_reader :items
  attr_accessor :name

  def initialize(name)
    @id = SecureRandom.uuid
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def genre_to_hash
    { name: @name }
  end
end
