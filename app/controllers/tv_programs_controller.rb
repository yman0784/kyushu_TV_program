class TvProgramsController < ApplicationController

  def index
  
  end

  def create

  end

  def show
    @tv_programs = TvProgram.find(params[:id])
  end

  def top
    if params[:id] == "55"
      @tv_programs = Fukuoka.all
      @prefecture_id = "55"
    elsif params[:id] == "56"
      @tv_programs = Kumamoto.all
      @prefecture_id = "56"
    elsif params[:id] == "57"
      @tv_programs = Nagasaki.all
      @prefecture_id = "57"
    elsif params[:id] == "58"
      @tv_programs = Kagoshima.all
      @prefecture_id = "58"
    elsif params[:id] == "59"
      @tv_programs = Miyazaki.all
      @prefecture_id = "59"
    elsif params[:id] == "60"
      @tv_programs = Oitum.all
      @prefecture_id = "60"
    elsif params[:id] == "61"
      @tv_programs = Saga.all
      @prefecture_id = "61"
    end
  end

  def top_show
    if params[:prefecture_id] == "55"
      @tv_programs = Fukuoka.find(params[:format])
    elsif params[:prefecture_id] == "56"
      @tv_programs = Kumamoto.find(params[:format])
    elsif params[:prefecture_id] == "57"
      @tv_programs = Nagasaki.find(params[:format])
    elsif params[:prefecture_id] == "58"
      @tv_programs = Kagoshima.find(params[:format])
    elsif params[:prefecture_id] == "59"
      @tv_programs = Miyazaki.find(params[:format])
    elsif params[:prefecture_id] == "60"
      @tv_programs = Oitum.find(params[:format])
    elsif params[:prefecture_id] == "61"
      @tv_programs = Saga.find(params[:format])
    end
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
    # @tv_program = TvProgram.copy(@tvs)
  end

  def search

  end

  private

  def search_actor_params
    params.require(:search_actor).permit(:actor, :prefecture_id)
  end

  def tv_params
    params.require(:tv_program).permit(:title, :time, :overview, :detail, :performer)
  end
end
