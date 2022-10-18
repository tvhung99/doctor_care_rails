class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.date :date_of_birth, null: false
      t.string :password_digest, null: false
      t.text :address
      t.string :phone_number
      t.boolean :gender, null: false
      t.datetime :confirmed_at

      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
