require 'digest'
require 'base64'

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
    params[:post][:userid] = makeHash
    params.require(:post).permit(:name, :email, :sub, :com, :upfile, :userid)
  end

  def makeHash
    @ip = 0
    request.remote_ip.split('.').each do |p|
      @ip *= 256
      @ip += p.to_i
    end
    t = Time.now
    @time = t.year.to_s + t.month.to_s + t.day.to_s

    @hash = Base64.encode64(Digest::MD5.new.update(@ip.to_s + @time).hexdigest).slice(0, 8)
  end
end
