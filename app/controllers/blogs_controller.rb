class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = policy_scope(Blog).order(published_at: :desc).page(params[:page])
  end

  def show
    viewed @blog
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def create
    @blog = Blog.new(blog_params.merge(author: current_user))
    authorize @blog

    respond_to do |format|
      if @blog.save
        @blog.create_activity :create, owner: current_user
        format.html { redirect_to @blog, notice: @blog.created_message }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: @blog.updated_message }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: @blog.destroyed_message }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.friendly.find(params[:id])
      authorize @blog
    end

    def blog_params
      params.require(:blog).permit(:header_image, :title, :teaser, :text, :published_at)
    end
end
