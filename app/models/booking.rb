class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pass_rental

  validates :status, inclusion: { in: %w[pending confirmed cancelled] }
end
