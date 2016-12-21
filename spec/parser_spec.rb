require 'parser'

describe Parser do
  describe '.substrings' do
    context 'when called on a string and an array of smaller strings' do
      string = "Nev knew things were looking grim for the future of his kingdom, but he refused to give ground on his chocolate road initiative."
      dictionary = ['king', 'hollywood', 'fuse', 'chocolate']
      it 'prints matches and amounts in a hash' do
        expect(Parser.substrings(string, dictionary)).to eq({"king"=>2, "fuse"=>1, "chocolate"=>1})
      end
    end
  end
end
