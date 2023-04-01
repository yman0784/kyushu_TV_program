class CreateNagasakis < ActiveRecord::Migration[6.0]
  def change
    create_table :nagasakis do |t|
      t.string :title
      t.string :time
      t.text :overview
      t.text :detail
      t.text :performer
      t.integer :prefecture_id
      t.timestamps
    end
  end
end
