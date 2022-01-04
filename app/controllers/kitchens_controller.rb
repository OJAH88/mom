class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :update, :destroy]

  # GET /kitchens
  def index
    @kitchens = @current_user.kitchens
    # byebug
    render json: @kitchens
  end

  # GET /kitchens/1
  def show
    render json: @kitchen
  end

  # POST /kitchens
  def create
    @kitchen = Kitchen.new(kitchen_params)

    if @kitchen.save
      render json: @kitchen, status: :created, location: @kitchen
    else
      render json: @kitchen.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kitchens/1
  def update
    if @kitchen.update(kitchen_params)
      render json: @kitchen
    else
      render json: @kitchen.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kitchens/1
  def destroy
    @kitchen.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitchen
      @kitchen = Kitchen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kitchen_params
      params.permit(:kitchen, :kitchen_id, :user_id)
    end
end
