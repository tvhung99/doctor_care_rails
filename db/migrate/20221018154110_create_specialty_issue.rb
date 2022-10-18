class CreateSpecialtyIssue < ActiveRecord::Migration[6.1]
  def change
    create_table :specialty_issues do |t|
      t.references :specialty, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
