class CreateAddress < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
