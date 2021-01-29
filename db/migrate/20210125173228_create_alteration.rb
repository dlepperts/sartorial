class CreateAlteration < ActiveRecord::Migration[6.1]
  def change
    create_table :alterations do |t|
      t.integer :item_type_id
      t.text :comments
      t.string :date

      t.integer :client_id
      t.integer :tailor_id
      t.string :status

      t.timestamps
    end
  end
end
