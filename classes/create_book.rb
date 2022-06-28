require_relative 'book'

class BookGenerator
  def create_book(date)
    print 'Publisher: '
    publisher = gets.chomp.to_s
    print 'Cover State: '
    cover_state = gets.chomp.to_s
    puts 'Book created successfully!'
    Book.new(date, publisher, cover_state)
  end
end