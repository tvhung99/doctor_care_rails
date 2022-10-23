class AddDeletedAtToSpecialtyIssue < ActiveRecord::Migration[6.1]
  def change
    add_column :specialty_issues, :deleted_at, :datetime
    add_index :specialty_issues, :deleted_at
  end
end
