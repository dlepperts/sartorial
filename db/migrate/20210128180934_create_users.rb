class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string "usable_type", default: "Client"
      t.integer "usable_id", default: 1
      t.index ["usable_type", "usable_id"], name: "index_users_on_usable"
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
