require_relative 'item'

class Game < Item
  def initialize(date, multiplayer, last_played_at)
    super(date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.mjd - Date.parse(@last_played_at).mjd) / 365 >= 2
  end
end
