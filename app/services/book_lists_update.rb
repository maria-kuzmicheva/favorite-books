class BookListsUpdate

#params={"authenticity_token"=>"[FILTERED]", "book_list__1"=>"0", "book_list__2"=>"1", "favorite_book_id"=>"2", "new_list"=>"fgrsrwfr", "commit"=>"добавить"}
    def initialize(params, current_user)
        @current_user       = current_user
        @params             = params
        @favorite_book_id   = @params["favorite_book_id"].to_i 
        @new_list_title     = @params["new_list"] 
    end


    def call
        favorite_book_to_new_book_list!
        favorite_book_to_book_lists!
    end

    def favorite_book_to_new_book_list!
        if @new_list_title.present?
            new_book_list = BookList.create(list_title: @new_list_title)
            new_book_list.favorite_books << favorite_book
        end
        
    end

    def favorite_book_to_book_lists!
       @params.each do |key, value|
        if value == "1" && key =~ /book_list__/
            book_list_id = key[11..].to_i
            book_list =  BookList.find(book_list_id) 
            book_list.favorite_books << favorite_book
        end
       end
    end

    private
    def favorite_book
        FavoriteBook.find(@favorite_book_id)
    end

end