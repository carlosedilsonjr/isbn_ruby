require_relative 'Isbn'

#isbn = Isbn.new((Integer(gets.chomp) rescue false))
isbn = Isbn.new(9780143007236)
#isbn.check(12456789)
isbn.check