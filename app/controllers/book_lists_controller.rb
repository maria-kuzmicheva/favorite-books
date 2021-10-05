class BookListsController < ApplicationController
    
    def create
    end

    def add_book

        ::BookListsUpdate.call(params) 
        
    end
    def show
        @book_list = BookList.find(params[:id])
        @book_list.favorite_books
    end

    def update
    end

    def delete
    end
    
end
