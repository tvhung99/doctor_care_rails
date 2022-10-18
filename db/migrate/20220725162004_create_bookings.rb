class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :time, null: false, foreign_key: true
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
