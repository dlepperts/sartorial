class CreateTailor < ActiveRecord::Migration[6.1]
  def change
    create_table :tailors do |t|
      t.text :bio
      
      t.timestamps
    end
  end
end
