class SetTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '時間を選択' }, { id: 2, name: '6時間' }, 
    { id: 3, name: '12時間' }, { id: 4, name: '24時間' }
  ]

  include ActiveHash::Associations

end