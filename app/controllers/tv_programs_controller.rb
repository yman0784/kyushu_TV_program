class TvProgramsController < ApplicationController

  def index
  
  end

  def create
    

    
  end

  def show

  end

  def find
    @finder = params
    if params[:prefecture_id] == "56"
      @tvs = Kumamoto.kumamoto_scrape(params)
    end
  end

  def search

  end

  private

  def search_actor_params
    params.require(:search_actor).permit(:actor, :prefecture_id)
  end
end
