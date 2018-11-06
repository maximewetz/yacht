class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)

    # if @reservation.save
    #   redirect_to @reservation, notice: 'Reservation was successfully created.'
    # else
    #   render :new
    # end
  end

  def update
    # if @reservation.update(reservation_params)
    #   redirect_to @reservation, notice: 'Reservation was successfully updated.'
    # else
    #   render :edit
    # end
  end

  def destroy
    @reservation.destroy
    # redirect_to reservations_url, notice: 'Reservation was successfully destroyed.'
  end

  private

    def reservation_params
      params.require(:reservation).permit(:booked_from, :booked_to, :boat_id, :user_id)
    end
# end
end
