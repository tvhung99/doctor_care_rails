class Specialty < ApplicationRecord
  acts_as_paranoid
  has_many_attached :images
  has_many :clinic_specialty_mappings
  has_many :doctors
  has_many :specialty_issues
end