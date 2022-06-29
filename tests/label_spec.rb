require_relative '../classes/label'
require_relative '../classes/game'

describe Label do
  context 'When testing Label class' do
    before :each do
      @label = Label.new('game', 'red')
      @game = Game.new('2022/06/28', true, '2022/07/21')
    end

    it 'Returns an instance of Label' do
      expect(@label).to be_instance_of(Label)
    end

    it 'Has correct name' do
      expect(@label.title).to eq 'game'
    end

    it 'Item adds itself to label.items array' do
      @game.add_label(@label)
      expect(@label.items).not_to be_empty
    end

    it 'Returns correct hash' do
      hash = { title: 'game', color: 'red' }
      expect(@label.label_to_hash).to eq hash
    end
  end
end