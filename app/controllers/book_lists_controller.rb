class BookListsController < ApplicationController
    
    before_action :auth, except: [:show, :public]

    def create
    end

    def add_book

        ::BookListsUpdate.new(params,@current_user).call 
        flash[:notice] = "книжка добавлена в указанные буклисты" 
        redirect_to favorite_book_path(params[:favorite_book_id ])
        
    end
    def index
       
        @book_lists = @current_user.book_lists
    end
    def show
        
        @book_list = BookList.find(params[:id])
        require_current_user
        if (@current_user.book_lists.find_by(id: params[:id]).present? if @current_user.present?) || @book_list.public?
            render :show
        else
            flash[:notice] = "извините этот буклист не является публичным" 
            redirect_to root_path
        end    
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
    
    def public
       @book_lists = BookList.shared.page(params[:page]).per(20)
        respond_to do |format|
            format.html
            format.json { render json: @book_lists }
          end
        
        
    end
end
