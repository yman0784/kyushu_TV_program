class TvProgramsController < ApplicationController
  before_action :deny_nil, only: [:find]

  def index
  
  end

  def show
    @tv_programs = TvProgram.find(params[:id])
  end

  def top
    @prefecture_programs = PrefectureProgram.extract(params).sort.reverse
    @prefecture_name = PrefectureProgram.prefecture_name(params)
  end

  def find
    TvProgram.scrape(params[:prefecture_id], params[:set_time_id], params[:actor])
    @tvs = TvProgram.keep(params)
    @finder = params
  end

  private

  def deny_nil
    params[:actor].gsub!(/[[:space:]]/, "")
    if params[:actor] == nil
      redirect_to "/"
    end
    unless params[:actor] =~ (/\A[(?=.*?[a-z])(?=.*?[\d])(?=.*?[ぁ-んァ-ヶ一-龥々ー])]+\z/i)
      redirect_to "/"
    end
  end

end

