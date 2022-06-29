require_relative 'item'

class Movie < Item
  def initialize(date, silent)
    super(date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end

  def movie_to_hash
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

    { silent: @silent, first_name: f_name,
      last_name: l_name, genre: gen }
  end
end
