require_relative 'Isbn'

RSpec.describe Isbn do
    def createIsbn(input)
        isbn = Isbn.new(input)
        return isbn.result
    end

    context "when passing letters as a parameter" do
        it "should return 'Invalid input, give a number!'" do
            expect(createIsbn("abcdefghijkl")).to eq "Invalid input, give a number!"
        end
    end

    context "when passing letters and number as a parameter" do
        it "should return 'Invalid input, give a number!'" do
            expect(createIsbn("abc123ghi45l")).to eq "Invalid input, give a number!"
        end
    end

    context "when passing a number with less than 12/13 digits" do
        it "should return 'Number have less than 12/13 digits!'" do
            expect(createIsbn(123456789)).to eq "Number have less than 12/13 digits!"
        end
    end

    context "when passing a number with more than 13 digits" do
        it "should return 'Number have more than 12/13 digits!'" do
            expect(createIsbn(12345678901234)).to eq "Number have more than 12/13 digits!"
        end
    end

    context "when passing a isbn number to validate (12 digits)" do
        it "should return the number validated" do
            expect(createIsbn(978014300723)).to eq(9780143007234)
        end
    end

    context "when passing a valid isbn number (13 digits)" do
        it "should return TRUE" do
            expect(createIsbn(9780143007234)).to be(true)
        end
    end

    context "when passing a invalid isbn number" do
        it "should return false" do
            expect(createIsbn(9780143007236)).to be(false)
        end
    end
end