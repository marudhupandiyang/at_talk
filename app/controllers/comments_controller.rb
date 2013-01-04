class CommentsController < ApplicationController

  http_basic_authenticate_with :user => "marudhu" , :password =>  'devbrother' , :only => [:destroy]

  def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create(params[:comment])

    if @comment.save
      redirect_to @post, :notice => "Comment Posted Sucessfully"
    else
      redirect_to @post, :notice => "There was some error in posting the comment"
    end
  end

  def destroy

    @post = Post.find(params[:post_id])
    @post.comments.find(params[:id]).destroy
    redirect_to @post, :notice => "Comment Deleted successfully"
  end

end
