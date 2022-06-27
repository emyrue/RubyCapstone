require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :label, :genre
  attr_reader :genre, :author, :source

  def initialize(genre, author, source, label, date)
    @id = SecureRandom.uuid
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = false
  end

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end


  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
  
  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
end
