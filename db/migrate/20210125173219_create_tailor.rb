class CreateTailor < ActiveRecord::Migration[6.1]
  def change
    create_table :tailors do |t|
      t.string :name
      t.text :bio
      
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
