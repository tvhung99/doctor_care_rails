class AddDegreeIdsToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :degree_ids, :string
  end
end
