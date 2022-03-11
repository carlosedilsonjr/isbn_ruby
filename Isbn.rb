class Isbn
    def initialize(isbnNumber)
        if(!(Integer(isbnNumber) rescue false))
            @result = 'Invalid input, give a number!'
        elsif(isbnNumber.to_s.size>13)
            @result = 'Number have more than 12/13 digits!'
        elsif(isbnNumber.to_s.size<12)
            @result = "Number have less than 12/13 digits!"
        else
            if(isbnNumber.to_s.size==12)
                @isbnNumber=isbnNumber
                self.validate
            else
                @isbnNumber=isbnNumber.to_s.chop.to_i
                @digitValidator=isbnNumber.to_s[-1].to_i
                @completeNumber=isbnNumber
                self.check
            end
        end
    end

    def validate
        sum =0
        array= @isbnNumber.to_s.chars
        array.each_index{|i| 
            if(i%2==0)
                sum += array[i].to_i * 1
            else
                sum += array[i].to_i * 3
            end}
        result = 10 - sum%10
        result = 0 if result==10
        numberValidated = @isbnNumber.to_s.concat(result.to_s).to_i
        @result = numberValidated
    end

    def check
        sum =0
        array= @isbnNumber.to_s.chars
        array.each_index{|i| 
            if(i%2==0)
                sum += array[i].to_i * 1
            else
                sum += array[i].to_i * 3
            end}
        result = 10 - sum%10
        result = 0 if result==10
        valid = result.eql?(@digitValidator)
        @result = valid
    end

    def result
        return @result
    end
end