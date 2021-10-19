class AdminPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user   = user
      @record = record
    end
  
    def stat?
      admin?
    end
    
    def users?
      admin?
    end
    def toggle_ban?
      admin?
    end

    private
    
    def admin?
      user.role == "admin"
    end

end