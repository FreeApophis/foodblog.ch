class SearchController < ApplicationController
  def search
    authorize :search

    respond_to do |format|
      format.html { full_search }
      format.json { render json: json_search }
    end
  end

  private

  def full_search
  end

  def json_search
    return unless params[:query]

    { success: true, results: [search_blog, search_recipes, search_user] }
  end

  def p_result category
    return { name: I18n.t(category, scope: :search), results: [] }
  end

  def search_blog
    result = p_result :blogs

    policy_scope(Blog).where("blogs.text LIKE ?","%#{params[:query]}%").limit(4).order(:title).each do |blog|
      result[:results] << { title: blog.title, description: blog.teaser, url: blog_path(blog) }
    end

    result
  end

  def search_recipes
    result = p_result :recipes

    policy_scope(Recipe).where("recipes.name LIKE ?","%#{params[:query]}%").limit(4).order(:name).each do |recipe|
      result[:results] << { title: recipe.name, description: recipe.description, url: recipe_path(recipe) }
    end

    result
  end

  def search_user
    result = p_result :users

    policy_scope(User).where("users.name LIKE ?","%#{params[:query]}%").limit(4).order(:name).each do |user|
      result[:results] << { title: user.name, description: user.email, url: user_path(user) }
    end

    result
  end
end
