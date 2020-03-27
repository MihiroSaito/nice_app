class PostsController < ApplicationController
  before_action :logged_in_user

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path 
    else
      flash.now[:alert] = '『タイトル』と『本文』の入力は必須です。'
      render :new
      
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def logged_in_user
    unless user_signed_in?
      redirect_to root_path
    end
  end
  
end
