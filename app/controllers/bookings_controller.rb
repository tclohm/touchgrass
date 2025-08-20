class BookingsController < ApplicationController
  before_action :ensure_verified_user, only: [:create]

  def index
    @bookings = current_user.bookings.includes(:pass_rental)
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def create
    @pass_rental = PassRental.find(params[:pass_rental_id])
    @booking = current_user.bookings.create(
      pass_rental: @pass_rental,
      status: 'verified_pending'
    )

    if @bookings.save
      redirect_to @booking, notice: 'Booking created! Please complete payment to confirm.'
    else 
      redirect_to @pass_rental, alert: @booking.errors.full_messages.join(', ')
    end
  end

  def update_deposit
    @booking = current_user.bookings.find(params[:id])
    # simulate successful payment
    if params[:payment_confirmed] == "true"
      @booking.update(
        deposit_status: 'held',
        status: 'confirmed'
      )
      redirect_to @booking, notice: 'Deposit held successfully! Booking confirmed.'
    else 
      redirect_to @booking, alert: 'Payment failed. Please try again.'
    end
  end 

  private 

  def ensure_verified_user
    unless current_user.fully_verified?
      redirect_to user_verification_path, alert: 'Please complete verification before booking.'
    end
  end
end
