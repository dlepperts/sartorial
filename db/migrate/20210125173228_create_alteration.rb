class CreateAlteration < ActiveRecord::Migration[6.1]
  def change
    create_table :alterations do |t|
      t.integer :item_type_id, array: true, default:[]
      t.text :comments
      t.datetime :date
      t.integer :client_id
      t.integer :tailor_id
      t.string :status, default: "Processing"

      t.timestamps
    end
  end
end
