require_relative 'item'

class Game < Item
  def initialize(genre, author, source, label, date, multiplayer, last_played_at)
    super(genre, author, source, label, date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.mjd - Date.parse(@last_played_at).mjd) / 365 >= 2
  end
end
