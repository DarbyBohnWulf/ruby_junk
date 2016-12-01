require 'cipher'

describe Cipher do

  describe ".caesar_cipher" do
    context "given a string and a shift factor" do
      it "returns a coded string" do
        expect(Cipher.caesar_cipher("cab",12)).to eq("omn")
      end
    end
  end
end
