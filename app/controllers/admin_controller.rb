class AdminController < ApplicationController
    before_action :require_current_user

   def stat
      authorize :admin
      @statistic = FavoriteBook.joins(:users).select("users.nickname").group("users.nickname").count
      
   end

end
