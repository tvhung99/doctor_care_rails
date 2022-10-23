class AddShortDescriptionToSpecialty < ActiveRecord::Migration[6.1]
  def change
    add_column :specialties, :short_description, :string
    add_column :specialties, :issue_title, :string
  end
end
