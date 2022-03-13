require_relative 'isbn'

RSpec.describe Isbn do

  context "when passing letters as a parameter" do
    it "should return a TypeError" do
      expect{Isbn.new("abcdefghijkl")}.to raise_error(TypeError)
    end
  end

  context "when passing letters and number as a parameter" do
    it "should return 'Invalid input, give a number!'" do
      expect{Isbn.new("abc123ghi45l")}.to raise_error(TypeError)
    end
  end

  context "when passing a number with less than 12/13 digits" do
    it "should return ArgumentError" do
      expect{Isbn.new(123456789)}.to raise_error(ArgumentError)
    end
  end

  context "when passing a number with more than 13 digits" do
    it "should return ArgumentError" do
      expect{Isbn.new(12345678901234)}.to raise_error(ArgumentError)
    end
  end

  context "when passing a isbn number to validate (12 digits)" do
    it "as number should return the number validated as number" do
      expect(Isbn.new(978014300723).result).to eq(9780143007234)
    end
    it "as string should return the number validated as string" do
      expect(Isbn.new('978014300723').result).to eq('9780143007234')
    end
  end

  context "when passing a valid isbn number (13 digits)" do
    it "should return TRUE" do
      expect(Isbn.new(9780143007234).result).to be(true)
    end
  end

  context "when passing a invalid isbn number" do
    it "should return false" do
      expect(Isbn.new(9780143007236).result).to be(false)
    end
  end
end
