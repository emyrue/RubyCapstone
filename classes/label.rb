require 'securerandom'

class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = SecureRandom.uuid
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def label_to_hash
    { title: @title, color: @color }
  end
end
