class Comment < ApplicationRecord
  belongs_to :prefecture_program
  belongs_to :user
end
