class BookListsController < ApplicationController
    before_action :auth
    def create
    end

    def add_book

        ::BookListsUpdate.new(params,@current_user).call 
        flash[:notice] = "книжка добавлена в указанные буклисты" 
        redirect_to favorite_book_path(params[:favorite_book_id ])
        
        
    end
    def show
        @book_list = BookList.find(params[:id])
        #@book_list.favorite_books
    end

    def update
    end

    def detach_book
        book_list = BookList.find(params[:id])
        book_list.favorite_books.destroy(params[:favorite_book_id])
        redirect_to book_list_path(params[:id])
    
    end

    def delete
    end
    
end
