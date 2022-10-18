class Doctor < ApplicationRecord
    belongs_to :user
    belongs_to :clinic
    has_one :specialty
    has_many :degree_doctor_mappings, dependent: :delete_all
    # has_many :degrees, through: :degree_doctor_mappings
end