class Degree < ApplicationRecord
    acts_as_paranoid
    has_many :degree_doctor_mappings
    # has_many :doctors, through: :degree_doctor_mappings
end