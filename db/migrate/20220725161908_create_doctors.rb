class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.references :specialty, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true
      t.integer :count_rate
      t.integer :total_rate

      t.timestamps
    end
  end
end
