class CreateSearchActors < ActiveRecord::Migration[6.0]
  def change
    create_table :search_actors do |t|
      t.string    :actor,           null: false
      t.integer :prefecture_id,           null: false
      t.timestamps
    end
  end
end
