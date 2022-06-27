require_relative 'classes/item'

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
end
