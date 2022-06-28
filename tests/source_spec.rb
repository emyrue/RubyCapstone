require_relative '../classes/source'
require_relative '../classes/movie'

describe Source do
    context 'When testing source class' do
        before :each do
            @source = Source.new('Juan.inc')
            @movie = Movie.new('2022/06/28', true)
        end

        it 'Returns an instance of Source' do
            expect(@source).to be_instance_of(Source)
        end

        it 'Has correct name' do
            expect(@source.name).to eq 'Juan.inc'
        end

        it 'Item adds itself to source.items array' do
            @movie.add_source(@source)
            expect(@source.items).not_to be_empty
        end

        it 'Returns correct hash' do
            hash = { name: 'Juan.inc' }
            expect(@source.source_to_hash).to eq hash
        end
    end
end