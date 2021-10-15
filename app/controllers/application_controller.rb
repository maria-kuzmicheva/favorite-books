class ApplicationController < ActionController::Base
  include Pundit 

  attr_reader :current_user

  def token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, hmac_secret, 'HS256')
  end
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  def record_not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def hmac_secret
    ENV["API_SECRET"]
  end

  def client_has_valid_token?
    !!current_user_id
  end

  def current_user_id
    if cookies[:auth_token].present?
      begin
        decoded_array = JWT.decode(cookies[:auth_token], hmac_secret, true, { algorithm: 'HS256' })
        payload = decoded_array.first
      rescue JWT::VerificationError
        return nil
      end
      payload["user_id"]
    end
  end

  def require_login
    render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
  end

  def require_current_user
    @current_user = User.find_by(id: current_user_id) if current_user_id
  end

  def auth
    if current_user_id.present?
    require_current_user
    else
      flash[:notice] = " пожалуйста, войдите в систему" 
      redirect_to login_path
    end
  end
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def unauthorized
    flash[:notice] = "Извините у вас нет доступа к этому ресурсу"
    redirect_to root_path
  end

end
