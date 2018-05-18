class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge!(user: current_user))
  end

  def update
    @post = @comment.post
    @comment.update(comment_params)
  end

  def destroy
    @post = @comment.post
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, attachments_attributes: %i[file])
  end
end
