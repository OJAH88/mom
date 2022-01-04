class UsersController < ApplicationController
  skip_before_action :authorize, only: :create
  before_action :set_user, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # def login
  #   user = User.find_by(email: params[:email])

  #   if user && user.authenticate(params[:password])
  #     payload = {user_id: user.id}
  #     token = encode(payload)
  #     byebug
  #     render :json => {user: user, token: token}
  #   else
  #     render json: {error: "User unfound"}
  #   end
    
  # end

  # def token_authenticate
  #   token = request.headers["Authenticate"]
  #   user = User.find(decode(token)["user_id"])
  #   render json: user
  # end

  # POST /users
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :password_digest, :name, :city, :state, :password, :password_confirmation)
    end
end
