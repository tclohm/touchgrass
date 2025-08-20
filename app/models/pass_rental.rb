class PassRental < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :start_date, :end_date, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[available booked] }
  validates :end_date_after_start_date

  def days
    (end_date - start_date).to_i + 1
  end

  private

  def end_date_after_start_date
    return unless start_date && end_date
    errors.add(:end_date, "must be after start date") if end_date < start_date
  end
end
