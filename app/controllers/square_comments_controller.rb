class SquareCommentsController < ApplicationController
  def create
    square = Square.find(params[:square_id])
    comment = current_user.square_comments.new(square_comment_params)
    comment.square_id = square.id
    if comment.save
      redirect_to square_path(square)
    end
  end

  def destroy
    SquareComment.find_by(id: params[:id]).destroy
    redirect_to square_path(params[:square_id])
  end

  private

  def square_comment_params
    params.require(:square_comment).permit(:comment)
  end
end
