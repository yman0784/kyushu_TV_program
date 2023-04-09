class PrefectureProgram < ApplicationRecord
  
  has_many :comments

  validates :overview, uniqueness: true

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
    return @week_programs.uniq
  end

  def self.prefecture_name(params)
    case params[:prefecture_id]
    when "55"
      return '福岡県'
    when "56"
      return '熊本県'
    when "57"
      return '長崎県'
    when "58"
      return '鹿児島県'
    when "59"
      return '宮崎県'
    when "60"
      return '大分県'
    when "61"
      return '佐賀県'
    end
  end
end
