class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = Comment.new(comment_params.merge(user: current_user, commentable: @commentable))
    authorize @comment

    if @comment.save
      @comment.create_activity :create, owner: current_user
      @commentable.touch
    end

    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_commentable
    if params[:blog_id]
      @commentable = Blog.friendly.find(params[:blog_id])
    else
      raise 'No commentable object present to comment'
    end
  end
end
