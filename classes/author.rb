require 'securerandom'

class Author
  attr_accessor :items
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author(self)
  end
end
