require_relative 'book'

class BookGenerator
  def create_book
    print 'Publisher: '
    publisher = gets.chomp.to_s
    print 'Cover State: '
    cover_state = gets.chomp.to_s
    print 'Date: '
    date = gets.chomp
    puts 'Book created successfully!'
    Book.new(date, publisher, cover_state)
  end
end