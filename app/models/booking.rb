class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pass_rental
end
