class ClinicSpecialtyMapping < ApplicationRecord
  belongs_to :clinic
  belongs_to :specialty

  scope :clinic_specialty, ->(clinic_id, specialty_id) { where(clinic_id: clinic_id, specialty_id: specialty_id) }


end