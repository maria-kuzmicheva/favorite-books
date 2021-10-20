class AdminController < ApplicationController
    before_action :require_current_user

   def stat
      authorize :admin
      @statistic = FavoriteBook.joins(:users).select("users.nickname").group("users.nickname").count
      
   end
   def users
      authorize :admin
      
      @users = User.all
      @users = @users.where(ban: params[:ban]) if ['true', 'false'].include?(params[:ban])
       
       @users = @users.page(params[:page]).per(20)
      
   end
   
   def toggle_ban
      authorize :admin
       User.find_by(id: params[:user_id]).toggle!(:ban)
      redirect_back(fallback_location: admin_users_path)
   end
   

end
