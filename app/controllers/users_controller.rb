class UsersController < ApplicationController
    
    def create 
        if correct_password? 
            @user = User.new(user_params)
            @user.password = params.dig(:user, :new_password)
           
            if @user.valid?
              @user.save!
              redirect_to root_path
            else
              flash[:notice] =  @user.errors.messages
              redirect_to new_user_path
            end
        else 
            flash[:notice] = "некорректный пароль/ либо его повтор" 
            redirect_to new_user_path
        end

        
    end

    def correct_password?
      new_password              =  params.dig(:user, :new_password)
      new_password_confirmation =  params.dig(:user, :new_password_confirmation)
      new_password =~ /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/ && (new_password == new_password_confirmation)
    end

    def user_params
      params.require(:user).permit(:full_name, :nickname, :email, :new_password, :new_password_confirmation)
    end
 

end
