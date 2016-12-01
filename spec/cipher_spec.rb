require 'cipher'

describe Cipher do

  describe ".caesar_cipher" do
    context "given a string and a shift factor" do
      it "returns a coded string" do
        expect(Cipher.caesar_cipher("cab",12)).to eq("omn")
      end
    end

    context "when a character shifts out of the alphabet" do
      it "carries over correctly" do
        expect(Cipher.caesar_cipher("zoo",1)).to eq("app")
      end
    end

    context "when given a whitespace or non letter character" do
      it "passes through unchanged" do
        expect(Cipher.caesar_cipher("55\s\n",10)).to eq("55\s\n")
      end
    end
  end
end
