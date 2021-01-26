class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review

      t.integer :client_id
      t.integer :tailor_id

      t.timestamps
    end
  end
end
