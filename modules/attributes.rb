require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/source'
require_relative 'store'

module Attributes
  include Store
  def item_author
    puts 'Would you like to (1)add a new author or (2)choose an author that is already on the list?'
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts 'Please enter a valid option: '
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts "What is the author's first name?"
      first_name = gets.chomp
      puts "What is the author's last name?"
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
      @authors << author.author_to_hash
      store_authors(@authors.to_json)
    else
      puts 'List of authors'
      list_all_authors
      index = gets.chomp.to_i
      author = @authors[index]
    end
    author
  end

  def item_label
    puts 'Would you like to (1)add a new label or (2)choose a label that is already on the list?'
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts 'Please enter a valid option: '
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts 'What is the label name?'
      label_name = gets.chomp
      puts 'What is color?'
      label_color = gets.chomp
      label = Label.new(label_name, label_color)
      @labels << label.label_to_hash
      store_labels(@labels.to_json)
    else
      puts 'List of labels'
      list_all_labels
      index = gets.chomp.to_i
      label = @labels[index]
    end
    label
  end

  def item_source
    puts 'Would you like to (1)add a new source or (2)choose a source that is already on the list?'
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts 'Please enter a valid option: '
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts 'What is the source name?'
      source_name = gets.chomp
      source = Source.new(source_name)
      @sources << source
      @sources << source.source_to_hash
      store_sources(@sources.to_json)
    else
      puts 'List of sources'
      list_all_sources
      index = gets.chomp.to_i
      source = @sources[index]
    end
    source
  end

  def item_genre
    puts 'Would you like to (1)add a new genre or (2)choose a genre that is already on the list?'
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts 'Please enter a valid option: '
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts 'What is the genre name?'
      genre_name = gets.chomp
      genre = Genre.new(genre_name)
      @genres << genre.genre_to_hash
      store_genres(@genres.to_json)
    else
      puts 'List of genres'
      genre = @genres[0]
    end
    genre
  end
end
