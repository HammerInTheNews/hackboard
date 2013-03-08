class PostsController < ApplicationController

  def index
  	@posts = Post.includes(:comments).all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:id])
  	#if post is valid - go to index
  	if @post.save
  		redirect_to post_path
  	else
  		render :new
  	end
  end

end
