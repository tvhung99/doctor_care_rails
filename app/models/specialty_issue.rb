class SpecialtyIssue < ApplicationRecord
  belongs_to :specialty

  scope :by_name, ->(name){ where(name: name)}
end