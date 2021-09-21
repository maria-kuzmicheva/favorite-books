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
        token = cookies[:session_token]
        decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
        payload = decoded_array.first
      rescue #JWT::VerificationError
        return nil
      end
      payload["user_id"]
    end
  
    def require_login
      render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
    end

end
