class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  skip_before_action 

  # GET /items
  def index
    @items = @current_user.items.all
    # byebug
    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = @current_user.items.create!(item_params)
    # byebug
    render json: @item
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.permit(:fridge_id, :freezer_id, :pantry_id, :kitchen_id, :recipe_id,  :in_kitchen, :in_shopping_list, :in_fridge, :in_freezer, :in_pantry, :shopping_list_id, :name, :food_group, :description, :amount, :measurement_type, :imgurl, :item, :item_id,  :id, :user_id, :user)
    end
end

