class Role < ApplicationRecord
  scope :exclude_admin, -> { where.not(id: [1,2])}
end
