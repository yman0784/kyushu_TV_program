class TvProgramsController < ApplicationController
  before_action :deny_nil, only: [:find]

  def index
  
  end

  def show
    @tv_programs = TvProgram.find(params[:id])
  end

  def top
    @prefecture_programs = PrefectureProgram.where(prefecture_id: params[:prefecture_id])
  end

  def find
    TvProgram.scrape(params[:prefecture_id], params[:set_time_id], params[:actor])
    @tvs = TvProgram.keep(params)
    @finder = params
  end

  private

  def deny_nil
    if params[:actor] == nil
      redirect_to "/"
    end
    unless params[:actor] =~ (/\A[(?=.*?[a-z])(?=.*?[\d])(?=.*?[ぁ-んァ-ヶ一-龥々ー])]+\z/i)
      redirect_to "/"
    end
  end

end

