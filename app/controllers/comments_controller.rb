class CommentsController < ApplicationController
    before_action :require_current_user
    
    def create
     if @current_user.present?
        comment = Comment.create(comments_params) 
        flash[:notice] = "ваш комментарий успешно добавлен"
        redirect_to favorite_book_path(comment.favorite_book)
     else
        flash[:notice] = "для комментирования войдите в профиль "
     end    
    end    
    
    def reply
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to  favorite_book_path(comment.favorite_book)
    end
  
    private

    def comments_params
      params.require(:comment).permit(:content, :user_id, :favorite_book_id, :parent_id)
    end

    
end
