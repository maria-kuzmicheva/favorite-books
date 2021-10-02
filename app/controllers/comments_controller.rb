class CommentsController < ApplicationController
    before_action :require_current_user
    
    def create
      Comment.create(comments_params) 
     if @current_user.present?
        Comment.create(comments_params) 
        flash[:notice] = "ваш комментарий успешно добавлен"
        redirect_to favorite_book_path(comments_params[:favorite_book_id])
     else
        flash[:notice] = "для комментирования войдите в профиль "
     end    
    end    
    
    def reply
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to_back
    end
  
    private

    def comments_params
      params.require(:comment).permit(:content, :user_id, :favorite_book_id, :parent_id)
    end

    
end
