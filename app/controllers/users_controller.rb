class UsersController < ApplicationController

  def index
    @bookings = Booking.all(params[:user_id])
  end

end
