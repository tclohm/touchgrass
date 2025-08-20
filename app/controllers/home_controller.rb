class HomeController < ApplicationController
  def index
    @available_passes = PassRental.where(status: 'available').limit(6)
  end
end
