class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = post.id
    @comment.save
    redirect_to posts_path
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.permit(:comment)
  end

end
