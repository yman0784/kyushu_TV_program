class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/prefecture_programs/#{comment.prefecture_program.id}"  
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prefecture_program_id: params[:prefecture_program_id])
  end

end
