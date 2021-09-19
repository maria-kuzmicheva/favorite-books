class UsersController < ApplicationController
    
    def create 
        if correct_password? 
            user = User.new(user_params[:user])
            user.password = user_params[:new_password]
           
                if user.valid?
                    @user.save!
                end
            else 
                redirect_to new_user_path
            end
    end
    
    def correct_password?
      params[:new_password] =~ /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/
      
    end

    def user_params
       
      params.require(:user).permit(:full_name, :nickname, :email, :password_digest)

     
    end

    

    

end
