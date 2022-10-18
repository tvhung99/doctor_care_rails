class CreateClinics < ActiveRecord::Migration[6.1]
  def change
    create_table :clinics do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :short_description
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
