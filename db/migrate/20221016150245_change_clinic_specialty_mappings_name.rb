class ChangeClinicSpecialtyMappingsName < ActiveRecord::Migration[6.1]
  def change
    rename_table :clincic_specialty_mappings, :clinic_specialty_mappings
  end
end
