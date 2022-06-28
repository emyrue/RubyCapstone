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

  def game_to_hash
    if defined?(@author[:last_name])
      f_name = @author[:first_name]
      l_name = @author[:last_name]
    else
      f_name = @author.first_name
      l_name = @author.last_name
    end

    gen = if defined?(@genre[:name])
            @genre[:name]
          else
            @genre.name
          end

    { multiplayer: @multiplayer, publish_date: @publish_date, first_name: f_name,
      last_name: l_name, genre: gen }
  end
end
