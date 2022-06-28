require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/source'

module Attributes
  def item_author
    puts "Would you like to (1)add a new author or (2)choose an author that is already on the list?"
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts "Please enter a valid option: "
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts "What is the author's first name?"
      first_name = gets.chomp
      puts "What is the author's last name?"
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
    else
      puts "List of authors"
      author = @authors[0]
    end
    return author
  end

  def item_label
    puts "Would you like to (1)add a new label or (2)choose a label that is already on the list?"
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts "Please enter a valid option: "
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts "What is the label name?"
      label_name = gets.chomp
      puts "What is color?"
      label_color = gets.chomp
      label = Label.new(label_name, label_color)
    else
      puts "List of labels"
      label = @labels[0]
    end
    return label
  end

  def item_source
    puts "Would you like to (1)add a new source or (2)choose a source that is already on the list?"
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts "Please enter a valid option: "
      choice = gets.chomp.to_i
    end
    if choice == 1
      puts "What is the source name?"
      source_name = gets.chomp
      source = Source.new(source_name)
    else
      puts "List of sources"
      source = @sources[0]
    end
    return source
  end

end