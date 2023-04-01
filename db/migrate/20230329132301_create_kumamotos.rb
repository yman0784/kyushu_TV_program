class CreateKumamotos < ActiveRecord::Migration[6.0]
  def change
    create_table :kumamotos do |t|
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
