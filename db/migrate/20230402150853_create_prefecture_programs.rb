class CreatePrefecturePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :prefecture_programs do |t|
      t.string :title
      t.string :time
      t.text :overview
      t.text :detail
      t.text :performer
      t.integer :prefecture_id
      t.string :extract_time
      t.timestamps
    end
  end
end
