class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of that post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
    
  end

 def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy

        redirect_to post_path(@post)
    end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:comment).permit(:body)
  end
    
end
