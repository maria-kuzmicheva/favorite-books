class FavoriteBooksController < ApplicationController
    before_action :auth, only: [:index, :show, :create, :destroy]

    def index
        flash[:notice] = "ваш имейл #{@current_user.email}" 
        @books = @current_user.favorite_books
        
    end
    
    def show
        @book = FavoriteBook.find(params[:id])
    end

    def create
       
        book = FavoriteBook.create(favorite_book_params)
        
        
        if book.valid? 
            flash[:notice] = "книга добавлена в Избранное" 
            redirect_to favorite_books_path
        else
            flash[:notice] = "книга ранее добавлена в Избранное"
            redirect_back(fallback_location: search_path)
        end
    
    end

    def destroy
        FavoriteBook.find(params[:id]).destroy
        redirect_to favorite_books_path
    
    end
    
    private

    def favorite_book_params
      params.require(:favorite_book).permit(:title, :author_name, :book_api_id)
    end

end
