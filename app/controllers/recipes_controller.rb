class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @tag = params[:tag]
    if @tag
      @recipes = policy_scope(Recipe).tagged_with(@tag).page(params[:page])
    else
      @recipes = policy_scope(Recipe).page(params[:page])
    end
  end

  def show  
    viewed @recipe
    @portions = (params[:portions] || @recipe.portions).to_i

    respond_to do |format|
      format.html { } 
      format.json { }
      format.pdf { render pdf: @recipe.name, layout: 'pdf.html', footer: { left: I18n.t('recipes.controller.pdf_page'), center: 'foodblog.ch', right: I18n.t('recipes.controller.pdf_author', author: @recipe.author.name) } }
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
        # @recipe.create_activity :create, owner: current_user
        format.html { redirect_to @recipe, notice: @recipe.created_message }
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
        format.html { redirect_to @recipe, notice: @recipe.updated_message }
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
      format.html { redirect_to recipes_url, notice: @recipe.destroyed_message }
      format.json { head :no_content }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.includes(:recipe_ingredients, :preparation_steps).friendly.find(params[:id])
      authorize @recipe
    end

    def recipe_params
      params.require(:recipe)
        .permit(:name, :description, :tag_list, :preparation_time, :cooking_time, :difficulty, :portions, 
          recipe_ingredients_attributes: [:id, :amount, :unit_id, :ingredient_id, :_destroy], 
          images_attributes: [:id, :file, :name, :_destroy],
          preparation_steps_attributes: [:id, :text, :_destroy])
    end
  def correct_so params
    if params && params[:preparation_steps_attributes]
      params[:preparation_steps_attributes].each_with_index do |ps, index|
        ps[1].merge!(sort_order: index)
      end
    end
    params
  end
end
