class CommentsController < ApplicationController
  
  # before_action :set_post

  def new
    # @post = Post.find(params[:id])
    @comment = Comment.new
    # p 'params id'
    # p @post.id
  end

  def create
    # @comment = @post.comments.new(params[:comment].permit(:body))
    p params
    p 'POOOOOSSTTTT IDDDDDDD'
    p params[:post_id]
    p 'JUSSTTTT IDDDDD'
    p params[:id]
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    p 'test'
    p @comment
    p 'test2'
    p @comment
    if @comment.save
      p 'SAVEEEEEDDDD'
      flash[:success] = "You commented the hell out of that post!"
      redirect_to post_path(@post)
    else
      p 'NOT SAVEEEEDDD'
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
    
  end

  def destroy
    @comment = @post.comments.find(params[:id])
  
    @comment.destroy
    flash[:success] = "Comment deleted :("
    redirect_to root_path
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
  
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    p 'params stufffffffffffff>>>>>>>'
    p params
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:comment).permit(:body)
  end
    
end
