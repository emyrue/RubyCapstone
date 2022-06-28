require_relative '../classes/author'
require_relative '../classes/book'

describe Author do
  context 'When testing Author class' do
    before :each do
      @author = Author.new('Emily', 'Robertson')
      @book = Book.new('2022/06/28', 'Juan.inc', 'Good')
    end

    it 'Returns instance of Author' do
      expect(@author).to be_instance_of(Author)
    end

    it 'Has correct first name' do
      expect(@author.first_name).to eq 'Emily'
    end

    it 'Has correct last name' do
      expect(@author.last_name).to eq 'Robertson'
    end

    it 'Item adds itself to author.items array' do
      @book.add_author(@author)
      expect(@author.items).not_to be_empty
    end
  end
end
