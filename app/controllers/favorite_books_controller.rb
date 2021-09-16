class FavoriteBooksController < ApplicationController

    def index
        
        @books = FavoriteBook.all
        
    end
    
    def show
        @book = FavoriteBook.find(params[:id])
    end

    def create
       
        #book = 
        
        FavoriteBook.create(favorite_book_params)
        redirect_to favorite_books_path
    
    end

    def destroy
        FavoriteBook.find(params[:id]).destroy
        redirect_to favorite_books_path
    
    end
    
    private

    def favorite_book_params
      params.require(:favorite_book).permit(:title, :author_name)
    end

end
