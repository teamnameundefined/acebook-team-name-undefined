class CommentsController < ApplicationController
  #sherif
  def new
    # @post = Post.find(params[:id])
    @comment = Comment.new
    # p 'params id'
    # p @post.id
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body))
    p 'test'
    p @comment
    p post_params
    @comment.user_id = current_user.id
    p 'test2'
    p @comment
    if @comment.save
      redirect_to post_path(@post)
    else
      @comment.errors.each do |attribute, message|
      end
            
      flash[:alert] = "Your comment couldn't be created! Please check the form."
      redirect_to post_path(@post)
    end
    
  end
  # Sherif

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new(params[:comment].permit(:body))
  #   if @comment.save
  #     redirect_to post_path(@post)
  #     flash[:notice] = "Your comment has been created!"
  #   elsif @comment.errors.any?
  #     @comment.errors.each do |attribute, message|
  #       end
      
  #     flash[:alert] = "Your comment couldn't be created! Please check the form."
  #     redirect_to post_path(@post)
  #   end
  # end

  private
  
  def post_params
    params.require(:comment).permit(:body)
  end
    
end
