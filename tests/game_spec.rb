require_relative '../classes/game'
require_relative '../classes/genre'
require_relative '../classes/author'

describe Game do
  context 'When testing game class' do
    before :each do
      @game = Game.new('2022/06/28', true, '2022/06/28')
      @genre = Genre.new('Action')
      @author = Author.new('Emily', 'Robertson')
    end

    it 'Returns an instance of Game' do
      expect(@game).to be_instance_of(Game)
    end

    it 'Can be archived method works correctly' do
      expect(@game.can_be_archived?).to eq false
    end

    it 'Game to hash method works correctly' do
      hash = {multiplayer: true, publish_date: '2022/06/28', first_name: 'Emily', last_name: 'Robertson', genre: 'Action'}
      @game.add_author(@author)
      @game.add_genre(@genre)
      expect(@game.game_to_hash).to eq hash
    end
  end
end
