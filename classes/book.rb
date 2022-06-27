require_relative 'item'

class Book < Item
  def initialize(date, publisher, cover_state)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end