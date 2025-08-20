class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.includes(:pass_rental)
  end

  def create
    @pass_rental = PassRental.find(params[:pass_rental_id])
    @booking = current_user.bookings.create(
      pass_rental: @pass_rental,
      status: 'pending'
    )

    redirect_to @pass_rental, notice: 'Booking request sent!'
  end
end
