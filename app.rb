require_relative 'Isbn'

#isbn = Isbn.new((Integer(gets.chomp) rescue false))
isbn = Isbn.new(9780143007234)
isbn2 = Isbn.new(9780143007236)
isbn.check
isbn2.check