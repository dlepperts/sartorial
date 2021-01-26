class CreateAlteration < ActiveRecord::Migration[6.1]
  def change
    create_table :alterations do |t|
      t.integer :item_type_id
      t.text :comments
      t.datetime :date

      t.timestamps
    end
  end
end
