class ApplicationController < ActionController::Base
    private
    def token(user_id)
      payload = { user_id: user_id }
      JWT.encode(payload, hmac_secret, 'HS256')
    end
  
    def hmac_secret
      ENV["API_SECRET"]
    end
  
    def client_has_valid_token?
      !!current_user_id
    end
  
    def current_user_id
      begin
        token = cookies[:auth_token]
        decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
        payload = decoded_array.first
      rescue JWT::VerificationError
        return nil
      end
      payload["user_id"]
    end
  
    def require_login
      render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
    end

    def auth
     if current_user_id.present?
       @current_user = User.find_by(id: current_user_id)
     else
       flash[:notice] = " пожалуйста, войдите в систему" 
       redirect_to login_path
     end
    end

end
