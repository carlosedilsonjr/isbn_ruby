require_relative 'Isbn'

#isbn = Isbn.new(gets.chomp)
isbn = Isbn.new(9780143007234)
isbn2 = Isbn.new(9780143007236)
puts isbn.result
puts isbn2.result