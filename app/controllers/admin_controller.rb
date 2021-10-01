class AdminController < ApplicationController
    before_action :require_current_user
 def stat
    @statistic = FavoriteBook.joins(:users).select("users.nickname").group("users.nickname").count
   

 end

end
