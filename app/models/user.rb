class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pass_rentals, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :government_id

  validates :phone_number, presence: true, format: { with: /A\d{10}\z/, message: "must be 10 digits"}

  scope :verified, -> { where(phone_verified: true, government_id_verified: true) }

  def fully_verified?
    phone_number? && government_id_verified? && government_id.attached?
  end

  def verification_status
    return "Not Started" unless phone_number.present?
    return "Phone Pending" unless phone_verified?
    return "ID Pending" unless government_id.attached?
    return "ID Review" unless government_id_verified?
    "Fully Verified"
  end
end
