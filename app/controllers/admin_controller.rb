class AdminController < ApplicationController
    
 def stat
    @statistic = FavoriteBook.joins(:users).select("users.nickname").group("users.nickname").count
   

 end

end
