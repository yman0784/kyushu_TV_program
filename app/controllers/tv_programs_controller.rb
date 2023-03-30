class TvProgramsController < ApplicationController

  def index
  
  end

  def create
    

    
  end

  def show

  end

  def find
    @finder = params
    if params[:prefecture_id] == "55"
      @tvs = Fukuoka.fukuoka_scrape(params)
    elsif params[:prefecture_id] == "56"
      @tvs = Kumamoto.kumamoto_scrape(params)
    elsif params[:prefecture_id] == "57"
      @tvs = Nagasaki.nagasaki_scrape(params)
    elsif params[:prefecture_id] == "58"
      @tvs = Kagoshima.kagoshima_scrape(params)
    elsif params[:prefecture_id] == "59"
      @tvs = Miyazaki.miyazaki_scrape(params)
    elsif params[:prefecture_id] == "60"
      @tvs = Oitum.oita_scrape(params)
    elsif params[:prefecture_id] == "61"
      @tvs = Saga.saga_scrape(params)
    end
  end

  def search

  end

  private

  def search_actor_params
    params.require(:search_actor).permit(:actor, :prefecture_id)
  end
end
