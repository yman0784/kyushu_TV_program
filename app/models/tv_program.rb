class TvProgram < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1 }
  
  def self.search(search)
    if search != ""
      TvProgram.where('text LIKE(?)', "%#{search}%")
    else
      TvProgram.all
    end
  end

end
