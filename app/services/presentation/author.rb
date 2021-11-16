module Presentation
    class Author 
        def initialize(sign)
            @sign = sign
        end

        def sign_book!(book) 
            book.sign = yield @sign 
            book
        end
    end
