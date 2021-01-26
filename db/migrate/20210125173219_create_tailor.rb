class CreateTailor < ActiveRecord::Migration[6.1]
  def change
    create_table :tailors do |t|
      t.string :name
      t.text :bio
      t.integer :address_id

      t.timestamps
    end
  end
end
