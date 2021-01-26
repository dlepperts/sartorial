class CreateClient < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :sex

      t.integer :measurement_id
      t.integer :address_id

      t.timestamps
    end
  end
end
