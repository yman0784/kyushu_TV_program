class TvProgramsController < ApplicationController

  def index
  
  end

  def create
    

    
  end

  def show

  end

  def find
    
  end

  def search
    @tv_programs = TvProgram.search(@search_actor[:actor])
    binding.pry
  end

  private

  def search_actor_params
    params.require(:search_actor).permit(:actor, :prefecture_id)
  end
end
