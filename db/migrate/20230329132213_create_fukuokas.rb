class CreateFukuokas < ActiveRecord::Migration[6.0]
  def change
    create_table :fukuokas do |t|
      t.string :title
      t.string :time
      t.text :overview
      t.text :detail
      t.string :performer
      t.timestamps
    end
  end
end
