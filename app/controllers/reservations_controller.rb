class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @user = current_user
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @user = current_user
  end

  def create
    @boat             = Boat.find(params[:boat_id])
    @reservation      = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.boat = @boat

    if @boat.avaible?
      if @reservation.save
        @boat.rented
        @boat.save
        redirect_to user_reservations_path(current_user)
      else
        render :new
      end
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @user = current_user
    if @reservation.update(reservation_params)
      redirect_to user_reservations_path(current_user, @reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy(reservation_params)
    redirect_to user_reservations_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:booked_from, :booked_to, :boat_id, :user_id)
  end
end
