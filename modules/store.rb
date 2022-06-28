module Store
  def store_books(obj)
    File.write('./data/books.json', obj)
  end

  def store_movies(obj)
    File.write('./data/movies.json', obj)
  end

  def store_games(obj)
    File.write('./data/games.json', obj)
  end

  def load_books
    file = File.open('./data/books.json')
    file_data = file.read
    if file_data == ''
      @books = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @books = convert_to_array
    end
  end

  def load_movies
    file = File.open('./data/movies.json')
    file_data = file.read
    if file_data == ''
      @movies = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @movies = convert_to_array
    end
  end

  def load_games
    file = File.open('./data/games.json')
    file_data = file.read
    if file_data == ''
      array = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      array = convert_to_array
    end
    file.close
    array
  end
end
