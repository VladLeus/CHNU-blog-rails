class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @post = @comment.post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post }
        format.turbo_stream
      else
        @comments = @post.comments.includes(:user)
        format.html { render 'posts/show', status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end


  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
