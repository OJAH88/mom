class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize

  private

  def secret_key
    "donkeybrains" 
  end

  def encode(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end 

  def decode(token)
    JWT.decode(token, "donkeybrains", true, {algorithm: 'HS256'})[0]
 end

  def authorize
    @current_user = User.find_by(id: session[:user_id])

    render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end