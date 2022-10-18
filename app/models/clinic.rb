class Clinic < ApplicationRecord
  acts_as_paranoid
  has_many :doctors
  has_many_attached :images
  has_many :clinic_specialty_mappings

  validates :name, presence: true
  validates :address, presence: true
  validates :short_description, presence: true
  validates :image, presence: true

end