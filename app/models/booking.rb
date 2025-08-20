class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pass_rental

  validates :status, inclusion: { in: %w[pending verified_pending deposit_held confirmed cancelled returned] }
  validates :security_deposit, presence: true, numericality: { greater_than: 500 }
  validates :deposit_status, inclusion: { in: %w[pending held released refunded] }

  before_validation :set_required_deposit
  before_create :check_user_verification

  scope :verified_users, -> { joins(:user).where(users: { phone_verified: true, government_id_verified: true }) }

  def can_be_confirmed?
    user.fully_verified? && deposit_status == 'held'
  end

  def total_cost
    (pass_rental.price + security_deposit).to_f
  end

  private

  def set_required_deposit
    min_deposit = [pass_rental&.price&.* (3) || 0, 500].max
    self.security_deposit = min_deposit
    self.deposit_status = 'pending' if deposit_status.blank?
  end

  def check_user_verification
    unless user.fully_verified?
      errors.add(:user, "must be fully verified to book")
      throw :abort
    end
  end
end
