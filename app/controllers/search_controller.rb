class SearchController < ApplicationController
  before_action :search_authorization
  before_action :set_query
  
  def search
    respond_to do |format|
      format.html { full_search }
      format.json { render json: json_search }
    end
  end

  def tags
    respond_to do |format|
      format.json { render json: tag_search }
    end
  end

  private

  def tag_search
    if @query
      @query.downcase!
      results = [{ name: @query, value: @query }]
    else
      results = []
    end

    policy_scope(ActsAsTaggableOn::Tag).where("tags.name LIKE \"#{@query}%\"").limit(10).order(:name).each do |tag|
      results << { name: tag.name, value: tag.name }
    end

    { success: true, results: results }
  end

  def full_search
  end

  def json_search
    return unless @query

    { success: true, results: [search_tags, search_recipes, search_blog, search_user] }
  end

  def p_result category
    return { name: I18n.t(category, scope: :search), results: [] }
  end

  def search_blog
    result = p_result :blogs

    policy_scope(Blog).where("blogs.text LIKE ?","%#{@query}%").limit(3).order(:title).each do |blog|
      result[:results] << { title: blog.title, description: blog.teaser, url: blog_path(blog) }
    end

    result
  end

  def search_tags
    result = p_result :tags

    policy_scope(ActsAsTaggableOn::Tag).where("tags.name LIKE \"#{@query}%\"").limit(2).order(:name).each do |tag|
      result[:results] << { title: tag.name, url: tag_recipes_path(tag.name) }
    end

    result
  end

  def search_recipes
    result = p_result :recipes

    policy_scope(Recipe).where("recipes.name LIKE ?","%#{@query}%").limit(3).order(:name).each do |recipe|
      result[:results] << { title: recipe.name, description: recipe.description, url: recipe_path(recipe) }
    end

    result
  end

  def search_user
    result = p_result :users

    policy_scope(User).where("users.name LIKE ?","%#{@query}%").limit(3).order(:name).each do |user|
      result[:results] << { title: user.name, description: user.email, url: user_path(user) }
    end

    result
  end

  def search_authorization
    authorize :search
  end

  def set_query
    @query = params[:query]
  end
end
