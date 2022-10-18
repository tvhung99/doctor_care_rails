class CreateSpecialties < ActiveRecord::Migration[6.1]
  def change
    create_table :specialties do |t|
      t.string :name, null: false
      t.text :description
      t.text :image


      t.timestamps
    end
  end
end
