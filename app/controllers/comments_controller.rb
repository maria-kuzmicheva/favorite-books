class CommentsController < ApplicationController
    
    
    def create
     Comment.create(comments_params)
     flash[:notice] = "ваш комментарий успешно добавлен"
     redirect_to favorite_book_path(comments_params[:favorite_book_id])
     
    end    
    
    def reply
    end

    def delete
        
    end
  
    private

    def comments_params
      params.require(:comment).permit(:content, :user_id, :favorite_book_id, :parent_id)
    end

    
end
