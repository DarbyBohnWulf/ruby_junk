require 'parser'

describe Parser do
  describe '.substrings' do
    context 'when called on a string and an array of smaller strings' do
      string = "Nev knew things were looking grim for the future of his kingdom, but he refused to give ground on his chocolate road initiative."
      dictionary = ['ing', 'king', 'hollywood', 'e']
      it 'prints matches and amounts in a hash' do
        expect(Parser.substrings(string, dictionary)).to eq({"ing"=>3, "king"=>1, "e"=>12})
      end
    end
  end
end
