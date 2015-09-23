class PostsController < ApplicationController
  def index
    @board = Board.first
    @newpost = Post.new
    @posts = Post.all
    @post = Post.new
  end
end
