class PrefectureProgramsController < ApplicationController

  def show

    @tv_programs = PrefectureProgram.find(params[:id])
    @prefecture_program = PrefectureProgram.find(params[:id])
    @comment = Comment.new
    @comments = @prefecture_program.comments.includes(:user)
  end

end
