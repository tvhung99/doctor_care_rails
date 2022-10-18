class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :bookings, null: false, foreign_key: true
      t.string :file
      t.text :description
      t.integer :price
      
      t.timestamps
    end
  end
end
