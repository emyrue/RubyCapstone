require_relative '../classes/book'

describe Book do
  context 'When testing book class' do
    before :each do
      @book = Book.new('2022/06/28', 'Juan', 'good')
    end

    it 'Returns an instance of Book' do
      expect(@book).to be_instance_of(Book)
    end

    it 'Can be archived method works correctly' do
      expect(@book.can_be_archived?).to eq false
    end

    it 'Book to hash method works correctly' do
      hash = { publisher: 'Juan', cover_state: 'good' }
      expect(@book.book_to_hash).to eq hash
    end
  end
end
