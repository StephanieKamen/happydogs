class DoghomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @doghomes = Doghome.all
  end

  def show
    @doghome = Doghome.find(params[:id])
    @booking = Booking.new
  end
end
