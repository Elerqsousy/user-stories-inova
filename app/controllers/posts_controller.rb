class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.rates = 0

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render 'new'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_posts_path(post.author_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
