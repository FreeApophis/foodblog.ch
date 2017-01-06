class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = policy_scope(Ingredient).page(params[:page])
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: @ingredient.created_message }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: @ingredient.updated_message }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: @ingredient.destroyed_message }
      format.json { head :no_content }
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.friendly.find(params[:id])
      authorize @ingredient
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :description, :density, :piece, :calorific_value, :protein, :fat, :carbohydrates, :sugar, :fiber)
    end
end
