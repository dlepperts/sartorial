class CreateMeasurement < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|

      t.float :waist
      t.float :chest_bust
      t.float :hips
      t.float :rise 
      t.float :neck

      t.integer :client_id

      t.timestamps
    end
  end
end
