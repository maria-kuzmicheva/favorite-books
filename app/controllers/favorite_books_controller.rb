class FavoriteBooksController < ApplicationController
    before_action :auth, only: [:index, :show, :create, :destroy]

    def index
        flash[:notice] = "ваш имейл #{@current_user.email}" 
        @books = @current_user.favorite_books.order(:created_at).page(params[:page]).per(2)
    end
    
    def show
        @book = FavoriteBook.find(params[:id])
        
    end

    def create
       
        #book = @current_user.favorite_books.create(favorite_book_params)
        book = FavoriteBook.find_by(book_api_id: params[:book_api_id])
        
        if book.present? 
            
            flash[:notice] = "книга добавлена в Избранное" 
            @current_user.favorite_books << book
            redirect_to favorite_books_path
        else
            flash[:notice] = "книга ранее добавлена в Избранное"
            @current_user.favorite_books.create(favorite_book_params)
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
