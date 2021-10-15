class AdminPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user   = user
      @record = record
    end
  
    def stat?
      user.role == "admin"
    end

end