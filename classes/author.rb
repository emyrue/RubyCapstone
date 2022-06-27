require 'securerandom'

class Author
  attr_reader :items

  def initialize(first_name, last_name)
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.new_author(self)
    @items << item
  end
end
