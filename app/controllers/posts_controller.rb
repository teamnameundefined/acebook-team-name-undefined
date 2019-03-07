class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "Your post has been created!"
    elsif @post.errors.any?
      @post.errors.each do |attribute, message|
     end
      
     flash[:alert] = "Your new post couldn't be created! Please check the form."
     render :new
    end
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    if @post.update(post_params)
      flash[:notice] = "Post was updated"
      redirect_to posts_path
    else
      flash[:notice] = "There was an error saving your post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path)
  end


  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
