require 'securerandom'

class Source
  attr_accessor :name, :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end

  def source_to_hash
    { name: @name }
  end
end
