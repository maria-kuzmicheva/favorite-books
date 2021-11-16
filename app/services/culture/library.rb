module Culture
    class Library 
        attr_accessor :books
        def initialize

            @books      = []
            @books_list = []
        end

        def <<(book)
            @books      << book
            @books_list << BookItem.new(book.title)

            puts "ok"
        end


        def books_count
            @books.count
        end

        def get_book!(reader, title)
           book      = @books.find{|book| book.title == title}
           book_item = @books_list.find{|book_item| book_item.title == title}
           timestamp = Time.now + 60
            if book.present?          
               book.deadline      = timestamp
               book_item.deadline = timestamp
               reader.accept_book!(@books.delete(book))
               puts "ok"
            elsif book_item.present?
                b
                puts "книга на руках до #{book_item.deadline}"
            else
                puts "такой не владеем"
            end
        end


        def return_book!(reader, title)
            book = reader.books.find{|book| book.title == title}
           if  book.present?
                book_item = @books_list.find{|book_item| book_item.title == title}
                book_item.deadline = nil
                @books << reader.return(book) 
                    if book.deadline > Time.now
                         puts "книга возвращена  вовремя"
                    else
                         puts  "книга возвращена с опозданием"
                    end
             
           else 
                puts "книга не найдена"
           end
        end


    end
end