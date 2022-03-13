class Isbn
  def initialize(isbn_number)
    @integer_input = isbn_number.is_a? Integer
    @isbn_number = isbn_number.to_s
    raise TypeError, "Expected a number!" unless @isbn_number.match?(/^\d+$/m)
    raise ArgumentError, "The number have more than 12/13 digits!" if @isbn_number.size > 13
    raise ArgumentError, "The number have less than 12/13 digits!" if @isbn_number.size < 12

    if(@isbn_number.size==12)
      self.validate
    else
      @complete_number = @isbn_number
      @digit_validator = @isbn_number[-1].to_i
      @isbn_number = @isbn_number.chop
      self.check
    end
  end

  def validate
    sum = 0
    array = @isbn_number.chars
    array.each_index do |i| 
      sum += array[i].to_i * 1 if i % 2 == 0
      sum += array[i].to_i * 3 if i % 2 == 1
    end
    result = 10 - sum % 10
    result = 0 if result == 10
    number_validated = @isbn_number.concat(result.to_s)
    @integer_input ? @result = number_validated.to_i : @result = number_validated
  end

  def check
    sum = 0
    array = @isbn_number.chars
    array.each_index do |i| 
      sum += array[i].to_i * 1 if i % 2 == 0
      sum += array[i].to_i * 3 if i % 2 == 1
    end
    result = 10 - sum % 10
    result = 0 if result == 10
    @result = result.eql?(@digit_validator)
  end

  def result
    @result
  end
end
