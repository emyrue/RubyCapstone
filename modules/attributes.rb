require_relative '../classes/author'

module Attributes
  def user_author
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
end