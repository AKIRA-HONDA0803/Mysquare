class SquareCommentsController < ApplicationController
  def create
    @square = Square.find(params[:square_id])
    comment = current_user.square_comments.new(square_comment_params)
    comment.square_id = @square.id
    if comment.save
    else
      redirect_to square_path(square)
    end
  end

  def destroy
    @square = Square.find(params[:square_id])
    square_comment = @square.square_comments.find(params[:id])
    square_comment.destroy
  end

  private

  def square_comment_params
    params.require(:square_comment).permit(:comment)
  end
end
