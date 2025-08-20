class PassRentalsController < ApplicationController
  before_action :set_pass_rental, only: [:show, :edit, :update, :destroy]

  def index
    @pass_rentals = PassRental.where(status: 'available').includes(:user)
  end

  def show
  end

  def new
    @pass_rentals = current_user.pass_rentals.build
  end

  def create
    @pass_rental = current_user.pass_rentals.build(pass_rental_params)
    @pass_rental.staus = 'available'

    if @pass_rental.save
      redirect_to @pass_rental, notice: 'Pass listed successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pass_rental.update(pass_rental_params)
      redirect_to @pass_rental, notice: 'Pass updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @pass_rental.destroy
    redirect_to pass_rental_path, notice: 'Pass removed!'
  end

  private

  def set_pass_rental
    @pass_rental = PassRental.find(params[:id])
  end

  def pass_rental_params
    params.require(:pass_rental).permit(:start_date, :end_date, :price)
  end
end
