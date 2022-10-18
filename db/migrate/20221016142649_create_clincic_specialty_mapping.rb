class CreateClincicSpecialtyMapping < ActiveRecord::Migration[6.1]
  def change
    create_table :clincic_specialty_mappings do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
