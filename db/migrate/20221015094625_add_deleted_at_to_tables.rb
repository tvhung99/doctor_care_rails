class AddDeletedAtToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :deleted_at, :datetime
    add_index :bookings, :deleted_at

    add_column :clinics, :deleted_at, :datetime
    add_index :clinics, :deleted_at

    add_column :degrees, :deleted_at, :datetime
    add_index :degrees, :deleted_at

    add_column :histories, :deleted_at, :datetime
    add_index :histories, :deleted_at

    add_column :posts, :deleted_at, :datetime
    add_index :posts, :deleted_at

    add_column :roles, :deleted_at, :datetime
    add_index :roles, :deleted_at

    add_column :specialties, :deleted_at, :datetime
    add_index :specialties, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :work_times, :deleted_at, :datetime
    add_index :work_times, :deleted_at

  end
end
