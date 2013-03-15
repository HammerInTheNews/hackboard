class PostsController < ApplicationController

  def index
    if params[:user_id]
      @posts = Post.where(user_id: params[:user_id]).includes(:comments)
    else
      @posts = Post.includes(:comments).all
    end
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

  def mine

    @posts = current_user.posts
    #using :index to refer to index.html.erb, if not a symbol, rails thinks it's a variable
    #render has to come after @posts
    render :index
  end

end
