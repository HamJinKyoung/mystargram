class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.content = params[:comment]
    @comment.save
    
    redirect_to '/'
  end

  def delete
    comment = Comment.find(params[:comment_id])
    comment.destroy
    
    redirect_to '/'
  end
  
  def edit
    @comment = Comment.find(params[:comment_id])
  end
  
  def update
    @comment = Comment.find(params[:comment_id])
    @comment.post_id = params[:post_id]
    @comment.content = params[:comment]
    @comment.save
    
    redirect_to '/home/index'
  end
end
