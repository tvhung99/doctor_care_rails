class CreateDegreeDoctorMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :degree_doctor_mappings do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :degree, null: false, foreign_key: true

      t.timestamps
    end
  end
end
