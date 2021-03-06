class CommentsController < ApplicationController
  before_action :set_commentable, only: [:create]

  def create
    @comment = Comment.new(comment_params.merge(user: current_user, commentable: @commentable))
    authorize @comment

    if @comment.save
      @comment.create_activity :create, owner: current_user
      @commentable.touch
    end

    redirect_to @commentable
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable

    authorize @comment
    @comment.destroy

    redirect_to @commentable
  end

private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_commentable
    if params[:blog_id]
      @commentable = Blog.friendly.find(params[:blog_id])
    elsif params[:recipe_id]
      @commentable = Recipe.friendly.find(params[:recipe_id])
    else
      raise 'No commentable object present to comment'
    end
  end
end
