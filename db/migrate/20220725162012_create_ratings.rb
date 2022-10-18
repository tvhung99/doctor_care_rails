class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :bookings, null: false, foreign_key: true
      t.integer :rate
      
      t.timestamps
    end
  end
end
