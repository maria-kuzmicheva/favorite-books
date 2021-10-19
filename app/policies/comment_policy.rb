class AdminPolicy
    attr_reader :user, :record
 def initialize(user, record)
        @user = user
        @record = record
 end
    
 def create?
   !user.ban
 end

end