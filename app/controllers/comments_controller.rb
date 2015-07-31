class CommentsController < ApplicationController

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
  end

  def edit
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(get_post)
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :text)
  end

  def get_post
    @post = Post.find(params[:post_id])
  end
end
