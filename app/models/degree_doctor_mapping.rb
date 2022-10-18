class DegreeDoctorMapping < ApplicationRecord
    belongs_to :doctor
    belongs_to :degree

    scope :get_degrees, -> (doctor_id) { where(doctor_id: doctor_id)}

end