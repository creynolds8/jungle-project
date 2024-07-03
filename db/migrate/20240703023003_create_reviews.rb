class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.text :description
      t.integer :rating
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
