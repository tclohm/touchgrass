class HomeController < ApplicationController
  skip_before_action :authenticate_users!, only: [:index]

  def index
    @available_passes = PassRental.where(status: 'available').limit(6)
  end
end
