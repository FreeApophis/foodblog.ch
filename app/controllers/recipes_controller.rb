class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = policy_scope(Recipe)
  end

  def show
    respond_to do |format|
      format.html { } 
      format.pdf do
        render pdf: @recipe.name,
            layout: 'pdf'
      end
      format.json { render json: @recipe }
    end
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(correct_so(recipe_params.merge(author: current_user)))
    authorize @recipe

    respond_to do |format|
      if @recipe.save
        @recipe.create_activity :create, owner: current_user
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @recipe.update(correct_so(recipe_params))
        @recipe.create_activity :update, owner: current_user
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.includes(:recipe_ingredients, :preparation_steps).find(params[:id])
      authorize @recipe
    end

    def recipe_params
      params.require(:recipe)
        .permit(:name, :description, :preparation_time, :cooking_time, :difficulty, :portions, 
          recipe_ingredients_attributes: [:id, :amount, :unit_id, :ingredient_id, :_destroy], 
          preparation_steps_attributes: [:id, :text, :_destroy])     
    end
  def correct_so params
    params[:preparation_steps_attributes].each_with_index do |ps, index|
      ps[1].merge!(sort_order: index)
    end
    params
  end
end
