require_relative 'item'

class Movie < Item
  def initialize(date, silent)
    super(date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end

  def movie_to_json
    { silent: @silent }
  end
end
