module Culture
    class Reader 
        attr_reader :books
        def initialize
            @books = []
        end
        

        def accept_book!(book)
            @books << book
        end

        def books_count
            @books.count
        end

        def return(book)
            @books.delete(book)

        end
    end
end