class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = post.id
    @comment.save
    redirect_to post_comment_path(id:post.id, post_id:post.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    post = Post.find(params[:post_id])
    redirect_to post_comment_path(id:post.id, post_id:post.id)
  end

  private

  def comment_params
    params.permit(:comment)
  end

end
