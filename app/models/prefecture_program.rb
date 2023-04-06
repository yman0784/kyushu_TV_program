class PrefectureProgram < ApplicationRecord
  
  has_many :comments

  require "date"

  def self.extract(params)
    @week_programs = []
    day = Date.today
    prefecture_programs = PrefectureProgram.where(prefecture_id: params[:prefecture_id])
    prefecture_programs.each do |program|
      if Date.parse(program[:extract_time]) > day.prev_day(7)
        @week_programs << program
      end
    end
    return @week_programs
  end
end
