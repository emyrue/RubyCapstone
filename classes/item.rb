require 'securerandom'
require 'date'

class Item
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

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
