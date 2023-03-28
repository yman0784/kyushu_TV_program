class CreateTvPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_programs do |t|
      t.string    :title
      t.text    :overview
      t.text      :detail
      t.text    :performer
      t.string    :time
      t.integer :prefecture_id
      # ,       null: false
      t.timestamps
    end
  end
end
