class ChangeTimeName < ActiveRecord::Migration[6.1]
  def change
    rename_table :times, :work_times
  end
end
