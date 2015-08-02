class PostsController < ApplicationController

  def index
    @posts = Post.all
    # or Post.where(author: session[:user])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # @user = User.find(session[:user]["id"])
    @post = Post.new(post_params)
    # if you want to use the current user instead of letting users type in an author name:
    # @post = Post.new(post_params.merge(author: session[:user]["name"]))
      if @post.save
        redirect_to @post
      else
        render 'new'
	# excellent!!
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    @post = Post.find(params[:id])
    # you can also handle the Post.find in a before action to DRY up code.
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :photo_url, :content)
  end

end
