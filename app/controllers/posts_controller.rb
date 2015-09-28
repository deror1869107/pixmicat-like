class PostsController < ApplicationController
  def index
    @board = Board.first
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    if params[:post][:name].empty?
      params[:post][:name] = "無名氏"
    end
    params.require(:post).permit(:name, :email, :sub, :com)
  end
end
