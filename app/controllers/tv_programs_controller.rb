class TvProgramsController < ApplicationController

  def index
    
  end

  def search
    @tv_programs = TvProgram.search(params[:keyword])
  end
end
