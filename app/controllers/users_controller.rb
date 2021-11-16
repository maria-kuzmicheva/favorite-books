class UsersController < ApplicationController
    before_action :auth, except: [:login]
    before_action :require_current_user
    protect_from_forgery except: :login
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


 


    def login 
      
        @user = User.find_by(email: params[:email])
        
          if @user.present?

            if right_password?
                jwt_token = token(@user.id)
                cookies[:auth_token] = jwt_token
               
                respond_to do |format|
                  format.html {redirect_to favorite_books_path}
                  format.json { render json: {token: jwt_token} }
                end
            else
                flash[:notice] = " извините, пароль неверен" 
                respond_to do |format|
                  format.html {redirect_to login_path}
                  format.json { render json: {error: 'password incorrect' }}

                end
                
            end
               
          else
            flash[:notice] = " извините, пользователь не найден" 
            
              respond_to do |format|
                  format.html {redirect_to root_path}
                  format.json { render json: {error: 'user not found' }}
                
              end
          end
        
    end

    def log_out
          require_current_user
          if @current_user.present?
              
                cookies[:auth_token] = nil
                redirect_to root_path
            else
                flash[:notice] = " извините, вы не вошли в систему" 
                redirect_to login_path
            
          end
    end

    def show

      require_current_user
      @book_lists = @current_user.book_lists
    end

    def toggle_public
       BookList.find_by(id: params[:book_list_id]).toggle!(:public)
       redirect_back(fallback_location: users_path(@current_user.id))
    end
   
    def edit
      
    end
    def update
      @current_user.update!(user_params)
      flash[:notice] = " обновление успешно сохранено" 
      redirect_to @current_user
    end
    private 
      def right_password?
          @user.password == params[:password]
      end
    
      def user_params
        params.require(:user).permit(:full_name, :nickname, :email, :new_password, :new_password_confirmation, :avatar)
      end


  end
