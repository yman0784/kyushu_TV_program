class TvProgram < ApplicationRecord
  require 'mechanize'

  def self.hours_check(hours)
    if hours == '2'
      @set_time = 6
    elsif hours == '3'
      @set_time = 12
    elsif hours == '4'
      @set_time = 24
    end
  end

  def self.url_check(prefecture_id, set_time)
    @url = "https://www.tvkingdom.jp/chart/#{prefecture_id}.action?head=&span=#{set_time}&chartWidth=950&cellHeight=3&sticky=false&descriptive=true&buttonType=0"
  end

  def self.scrape(prefecture, time, actor)
    time = hours_check(time)
    url = url_check(prefecture, time)
    agent = Mechanize.new
    page = agent.get(url)
    @elements = page.search('.td-schedule a')
    urls = []
    @elements.each do |ele| 
      urls << ele.get_attribute(:href) 
    end
    @data = []
    urls.each do |url| 
      data = {}
      page = agent.get(url) 
      if (page.search('h1').inner_text != "Gガイド.テレビ王国")
        data[:title] = page.search('h1').inner_text
        data[:overview] = page.search('html/body/div[6]/div[1]/div[2]/p[@class="basicTxt"]').inner_text
        data[:detail] = page.search('html/body/div[6]/div[1]/div[3]/p[@class="basicTxt"]').inner_text.gsub(/\n|\r\n|\r/,'').gsub(/\t/,'')
        data[:act] = page.search('/html/body/div[6]/div[1]/div[4]/p[@class="basicTxt"]').inner_text
        if page.search('/html/body/div[6]/div[1]/div[1]/dl/dd[1]/text()').inner_text != ""
          data[:time] = page.search('/html/body/div[6]/div[1]/div[1]/dl/dd[1]/text()').inner_text.gsub(/\n|\r\n|\r/,'').gsub(/\t/,'')
        elsif page.search('/html/body/div[6]/div[1]/div[1]/div/div/dl/text()').inner_text != ""
          data[:time] = page.search('/html/body/div[6]/div[1]/div[1]/div/div/dl/text()').inner_text.gsub(/\n|\r\n|\r/,'').gsub(/\t/,'')
        else 
          data[:time] = ""
        end
        @data << data
      end
      # sleep (1)
    end
  end

  def self.keep(params)
    @tele =[]
    @data.each do |d| 
      if d[:act].include?("#{params[:actor]}")
      @tv = PrefectureProgram.new
      @tv = PrefectureProgram.create(title: d[:title], time: d[:time], overview: d[:overview], detail: d[:detail], performer: d[:act], prefecture_id: params[:prefecture_id])
      @tv_program= TvProgram.create(title: d[:title], time: d[:time], overview: d[:overview], detail: d[:detail], performer: d[:act], prefecture_id: params[:prefecture_id])
      @tele << @tv_program
      end   
    end 
  return @tele
  end
end
