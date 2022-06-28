module Store
  def store_books(obj)
    File.write('./data/books.json', obj)
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

  def store_labels(obj)
    File.write('./data/labels.json', obj)
  end

  def load_labels
    file = File.open('./data/labels.json')
    file_data = file.read
    if file_data == ''
      @labels = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @labels = convert_to_array
    end
  end

  def store_authors(obj)
    File.write('./data/authors.json', obj)
  end

  def load_authors
    file = File.open('./data/authors.json')
    file_data = file.read
    if file_data == ''
      @authors = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @authors = convert_to_array
    end
  end

  def store_sources(obj)
    File.write('./data/sources.json', obj)
  end

  def load_sources
    file = File.open('./data/sources.json')
    file_data = file.read
    if file_data == ''
      @sources = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @sources = convert_to_array
    end
  end

  def store_genres(obj)
    File.write('./data/genres.json', obj)
  end

  def load_genres
    file = File.open('./data/genres.json')
    file_data = file.read
    if file_data == ''
      @genres = []
    else
      convert_to_array = JSON.parse(file_data, symbolize_names: true)
      @genres = convert_to_array
    end
  end

end
