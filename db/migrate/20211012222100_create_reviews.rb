class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :restaurant, null: false, foreign_key: true
      # t.integer :restaurant_id # NEVER DO THIS!!!

      t.timestamps
    end
  end
end
